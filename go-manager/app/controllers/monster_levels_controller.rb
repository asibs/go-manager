class MonsterLevelsController < ApplicationController
  before_action :set_monster_level, only: [:show]

  # GET /monster_levels
  # GET /monster_levels.json
  def index
    @monster_levels = MonsterLevel.all
  end

  # GET /monster_levels/1
  # GET /monster_levels/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_level
      @monster_level = MonsterLevel.find(params[:id])
    end

end
