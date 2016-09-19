class TrainerLevelsController < ApplicationController
  before_action :set_trainer_level, only: [:show]

  # GET /trainer_levels
  # GET /trainer_levels.json
  def index
    @trainer_levels = TrainerLevel.all
  end

  # GET /trainer_levels/1
  # GET /trainer_levels/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainer_level
      @trainer_level = TrainerLevel.find(params[:id])
    end


end
