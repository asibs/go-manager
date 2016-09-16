class TeamLeadersController < ApplicationController
  before_action :set_team_leader, only: [:show]

  # GET /team_leaders
  # GET /team_leaders.json
  def index
    @team_leaders = TeamLeader.all
  end

  # GET /team_leaders/1
  # GET /team_leaders/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_leader
      @team_leader = TeamLeader.find(params[:id])
    end

end
