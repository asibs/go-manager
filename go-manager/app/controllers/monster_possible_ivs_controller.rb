class MonsterPossibleIvsController < ApplicationController
  before_action :set_monster_possible_iv, only: [:show]

  # GET /monster_possible_ivs
  # GET /monster_possible_ivs.json
  def index
    @monster_possible_ivs = MonsterPossibleIv.all
  end

  # GET /monster_possible_ivs/1
  # GET /monster_possible_ivs/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_possible_iv
      @monster_possible_iv = MonsterPossibleIv.find(params[:id])
    end

end
