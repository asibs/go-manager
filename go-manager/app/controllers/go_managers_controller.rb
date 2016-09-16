class GoManagersController < ApplicationController
  before_action :set_trainer, only: [:show, :create]

  # GET /go_managers/1
  # GET /go_managers/1.json
  def show
  end

  # POST /go_managers
  # POST /go_managers.json
  def create
    #byebug

    create_params = go_manager_params
    logger.info 'created_params'

    @monster = Monster.new(name: create_params[:name], trainer_id: @trainer.id)
    logger.info 'created new Monster'
    #@monster.save
    
    #monster_evolution = @monster.monster_evolution.build(species_id: create_params[:species_id])
    @monster.monster_evolution.build(species_id: create_params[:species_id])
    logger.info 'built monster evolution'
    #@monster.save
    
    #monster_evolution.monster_level.build(cp: create_params[:cp], hp: create_params[:hp],
    #                                      dust_to_power_up: create_params[:dust_to_power_up], never_powered_up: create_params[:never_powered_up])
    @monster.monster_evolution.first.monster_level.build(cp: create_params[:cp], hp: create_params[:hp],
                                                   dust_to_power_up: create_params[:dust_to_power_up],
                                                   never_powered_up: create_params[:never_powered_up])
    logger.info 'built monster level'

    @monster.build_monster_appraisal(appraisal_overall_phrase_id: create_params[:appraisal_overall_phrase_id],
                                     attack_best: create_params[:attack_best], defense_best: create_params[:defense_best], stamina_best: create_params[:stamina_best],
                                     appraisal_individual_phrase_id: create_params[:appraisal_individual_phrase_id])
    logger.info 'built monster appraisal'

    #raise ActiveRecord::Rollback

    @monster.build_monster_summary
    logger.info 'built monster summary'

    respond_to do |format|
      if @monster.save
        CalculateIvsJob.perform_later(@monster.id)
        format.html { redirect_to controller: 'go_manager', action: 'show', trainer_id: @trainer.id, notice: 'Go manager was successfully created.' }
        format.json { render :show, status: :created, location: @go_manager }
      else
        format.html { render :show }
        format.json { render json: @go_manager.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainer
      @trainer = Trainer.find(params[:trainer_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def go_manager_params
      params.permit(:trainer_id,
                    :name,
                    :species_id,
                    :cp, :hp, :dust_to_power_up, :never_powered_up,
                    :appraisal_overall_phrase_id, :attack_best, :defense_best, :stamina_best, :appraisal_individual_phrase_id,
                    :utf8, :authenticity_token, :commit) 
    end
end
