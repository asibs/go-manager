class Monster < ApplicationRecord

  # every Monster is linked to a Trainer, through trainer_id
  belongs_to :trainer

  # a Monster has one MonsterSummary
  has_one :monster_summary

  # a Monster has one MonsterAppraisal
  has_one :monster_appraisal

  # a Monster has many MonsterEvolutions (we want the most recent first)
  has_many :monster_evolution, -> { order 'id DESC' }

  # a Monster has many MonsterPossibleIvs
  has_many :monster_possible_iv

  def current_evolution
    # Just get the first, since we're ordering in the association
    self.monster_evolution.first
  end

  def current_level
    self.current_evolution.current_level
  end

  def current_species
    self.current_evolution.species
  end

  def current_species_base_stat
    self.current_species.species_base_stat
  end

  def appraisal
    self.monster_appraisal
  end

  def overall_appraisal
    self.appraisal.appraisal_overall_phrase
  end

  def individual_appraisal
    self.appraisal.appraisal_individual_phrase
  end

end
