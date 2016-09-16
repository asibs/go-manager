class CalculateIvsJob < ApplicationJob
  queue_as :default

  def perform(monster_id)
    # Get current values / records
    monster = Monster.find(monster_id)
    m_evolution = monster.current_evolution
    m_level = m_evolution.current_level
    m_appraisal = monster.monster_appraisal
    m_overall_appraisal = m_appraisal.appraisal_overall_phrase
    m_individual_appraisal = m_appraisal.appraisal_overall_phrase

    min_total_iv = m_overall_appraisal.min_total_iv
    max_total_iv = m_overall_appraisal.max_total_iv


    #TODO: Lock down the summary, so no other threads / instances try to update while we're updating

    possible_levels = LevelsDatum.where(stardust_to_power_up: m_level.dust_to_power_up)
    iv_loop_helper = IvLoopHelper.new(monster)

    logger.info "possible_levels: [#{possible_levels}]"

    possible_levels.each do |possible_level|
      logger.info "possible_level: [#{possible_level}]"

      outer_values = iv_loop_helper.validate_and_get_outer_values(possible_level)
      logger.info "outer_values: [#{outer_values}]"
      outer_values.each do |i|

        middle_values = iv_loop_helper.validate_and_get_middle_values(i)
        logger.info "middle_values: [#{middle_values}]"
        middle_values.each do |j|

          inner_values = iv_loop_helper.validate_and_get_inner_values(j)
          logger.info "inner_values: [#{inner_values}]"
          inner_values.each do |k|

            logger.info "Potential IV combo, [Level: #{possible_level.level_id}], [Attack: #{i}], [Defense: #{j}], [Stamina: #{k}]"

            if iv_loop_helper.inner_validation(k) then
              # Found a match!
              monster.possible_iv.build(level_id: possible_level.id,
                                        attack: iv_loop_helper.get_attack,
                                        defense: iv_loop_helper.get_defense,
                                        stamina: iv_loop_helper.get_stamina)
            end

          end # end inner IV loop

        end # end middle IV loop

      end # end outer IV loop

    end # end levels loop

  end

end


class IvLoopHelper

  def initialize(monster)
    # Outer loop is always stamina, as the possible values of this will
    # generally be heavily constrained by the HP (stamina is the only IV
    # involved in determining HP)
    @outer_loop_stat = :stamina
    @outer_loop_best_stat = monster.appraisal.stamina_best

    # Choose the best of the remaining stats for middle loop,
    # defaulting to defense if both / neither of ATT / DEF are best
    # The best stat is constrained by the individual stats appraisal,
    # and will give an upper bound to the remaining inner loop stat

    if !monster.appraisal.attack_best then
      # Attack isn't best, so choose defense for middle loop
      @middle_loop_stat = :defense
      @middle_loop_best_stat = monster.appraisal.defense_best
      @inner_loop_stat = :attack
      @inner_loop_best_stat = false
    else
      # Attack is best, so choose attack for middle loop
      @middle_loop_stat = :attack
      @middle_loop_best_stat = true
      @inner_loop_stat = :defense
      @inner_loop_best_stat = monster.appraisal.defense_best
    end

    @best_stats_min = monster.individual_appraisal.min_individual_iv
    @best_stats_max = monster.individual_appraisal.max_individual_iv

    @min_total_iv = monster.overall_appraisal.min_total_iv
    @max_total_iv = monster.overall_appraisal.max_total_iv

    @monster_cp = monster.current_level.cp
    @monster_hp = monster.current_level.hp

    @species_base_stats = monster.current_species_base_stat
  end

  def validate_and_get_outer_values(level)
    # Outer loop is always Stamina

    @level = level

    outer_values = []

    # If stamina is the best stat, constrain by best stat range,
    # otherwise it has no lower bound, but must be less than the max value for the best stat
    min = ( @outer_loop_best_stat ? @best_stats_min : 0 )
    max = ( @outer_loop_best_stat ? @best_stats_max : @best_stats_max-1 )

    # Only allow values which would generate the correct HP at the current level
    (min ... max).each do |sta|
      if ( calculate_hp(@species_base_stats, sta, @level.cp_multiplier) == @monster_hp ) then
        outer_values.push(sta)
      end
    end

    return outer_values
  end

  def validate_and_get_middle_values(stamina)
    # Outer loop is always stamina, so when calculating middle loop
    # values we're getting the current value of stamina

    # Cache current value for Stamina and it's component in the cp calculation
    @stamina = stamina
    @stamina_cp_component = calculate_stamina_cp_component(@species_base_stats, @stamina, @level.cp_multiplier)

    middle_values = []

    if @middle_loop_stat_best then
      if @outer_loop_stat_best then
        # Both Outer (Stamina) and the middle stat are the best, so they must be equal
        middle_values.push(@stamina)
      else
        # Middle is best, Outer is not - Middle must be strictly greater than Outer
        min_value = max( @best_stats_min, @stamina+1 )
        max_value = @best_stats_max
        middle_values.push( min_value ... max_value )
      end
    else
      if @outer_loop_stat_best then
        # Outer is best, Middle is not - Middle must be strictly less than Outer
        min_value = 0
        max_value = @stamina-1
        middle_values.push( min_value ... max_value )
      else
        # Neither Outer nor Middle are best - Something gone wrong!
        #TODO: should never happen... Error
      end
    end

    return middle_values
  end

  def validate_and_get_inner_values(middle_value)
    # Cache the middle loop stat and it's component in the cp calculation
    if (@middle_loop_stat == :defense) then
      @defense = middle_value
      @defense_cp_component = calculate_defense_cp_component(@species_base_stats, @defense, @level.cp_multiplier)
    else
      @attack = middle_value
      @attack_cp_component = calculate_attack_cp_component(@species_base_stats, @attack, @level.cp_multiplier)
    end

    inner_values = []

    if @inner_loop_stat_best then
      # If the inner loop is best, so must be the middle, so same value
      inner_values.push(middle_value)
    else
      # Min is constrained by being within the min total IV
      remaining_iv_to_min = @min_total_iv - @stamina - middle_value
      min_value = non_negative(remaining_iv_to_min)

      # Max is constrained both by being less than the best value, and by being within the max total IV
      max_inner_value = max(@stamina, middle_value)-1
      remaining_iv_to_max = @max_total_iv - @stamina - middle_value
      max_value = min(max_inner_value, remaining_iv_to_max)

      if (min_value > 15 || max_value < 0) then
        # Impossible to hit the total IV range, don't add any values
      else
        inner_values.push(min_value ... max_value)
      end
    end

    return inner_values

  end

  def inner_validation(inner_value)
    # calculate the inner loop stat's component in the cp calculation
    if (@inner_loop_stat == :attack) then
      @attack = inner_value
      @attack_cp_component = calculate_attack_cp_component(@species_base_stats, @attack, @level.cp_multiplier)
    else
      @defense = inner_value
      @defense_cp_component = calculate_defense_cp_component(@species_base_stats, @defense, @level.cp_multiplier)
    end

    calculated_cp = calculate_cp_from_components(@attack_cp_component, @defense_cp_component, @stamina_cp_component)
    return (calculated_cp == @monster_cp)

  end

  def get_attack
    return @attack
  end

  def get_defense
    return @defense
  end

  def get_stamina
    return @stamina
  end

  def get_outer_range
    range = Hash.new

    range[:min] = @best_stats_min
    range[:max] = @best_stats_max
    return range
  end

  def get_middle_range(current_outer_value)
    range = Hash.new

    if @middle_loop_stat_best then
      range[:min] = current_outer_value
      range[:max] = current_outer_value
    else
      # Min is constrained by being within the min total IV
      # We don't know the exact inner loop value yet, but know it has a max of current_outer_value - 1
      remaining_iv_to_min = @min_total_iv - current_outer_value - (current_outer_value-1)
      range[:min] = non_negative(remaining_iv_to_min)

      # Max is constrained both by being less than the best value, and by being within the max total IV
      max_middle_value = current_outer_value-1
      remaining_iv_to_max = @max_total_iv - current_outer_value
      range[:max] = non_negative(min(max_middle_value, remaining_iv_to_max))

      if (range[:min] > range[:max]) then
        # Impossible to hit the total IV range given the other constraints
        # return special -1 values for both
        range[:min] = -1
        range[:max] = -1
      end
    end

    return range
  end

  def get_inner_range(current_outer_value, current_middle_value)
    range = Hash.new

    if @inner_loop_stat_best then
      range[:min] = current_outer_value
      range[:max] = current_outer_value
    else
      # Min is constrained by being within the min total IV
      remaining_iv_to_min = @min_total_iv - current_outer_value - current_middle_value
      range[:min] = non_negative(remaining_iv_to_min)

      # Max is constrained both by being less than the best value, and by being within the max total IV
      max_inner_value = current_outer_value-1
      remaining_iv_to_max = @max_total_iv - current_outer_value - current_middle_value
      range[:max] = non_negative(min(max_middle_value, remaining_iv_to_max))

      if (range[:min] > range[:max]) then
        # Impossible to hit the total IV range given the other constraints
        # return special -1 values for both
        range[:min] = -1
        range[:max] = -1
      end
    end

    return range
  end


private
    def calculate_hp(species_base_stats, stamina, cp_multiplier)
      calculated_hp = effective_stat_value(species_base_stats.base_stamina, sta, cp_multiplier).floor
      return min( calculated_hp, 10 )
    end

    def calculate_cp(species_base_stats, attack, defense, stamina, cp_multiplier)
      attack_componet = calculate_attack_cp_component(species_base_stats, attack, cp_multiplier)
      defense_componet = calculate_defense_cp_component(species_base_stats, defense, cp_multiplier)
      stamina_componet = calculate_stamina_cp_component(species_base_stats, stamina, cp_multiplier)
      return calculate_cp_from_components(attack_component, defense_component, stamina_component)
    end

    def calculate_cp_from_components(attack_componet, defense_component, stamina_component)
      calculated_cp = ( 0.1 * attack_componet * defense_component * stamina_component ).floor
      return min( calculated_cp, 10 )
    end

    def calculate_attack_cp_component(species_base_stats, attack, cp_multiplier)
      return effective_stat_value(species_base_stats.base_attack, attack, cp_multiplier)
    end

    def calculate_defense_cp_component(species_base_stats, defense, cp_multiplier)
      return effective_stat_value(species_base_stats.base_defense, defense, cp_multiplier) ** 0.5
    end

    def calculate_stamina_cp_component(species_base_stats, stamina, cp_multiplier)
      return effective_stat_value(species_base_stats.base_stamina, stamina, cp_multiplier) ** 0.5
    end

    def effective_stat_value(stat_base_value, stat_iv_value, cp_multiplier)
      return (stat_base_value + stat_iv_value) * cp_multiplier
    end

    def max(a, b)
      return ( a > b ? a : b )
    end

    def min(a, b)
      return ( a < b ? a : b )
    end

    def non_negative(n)
      return max( n, 0 )
    end

end