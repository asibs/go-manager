class TeamLeadersController < ApplicationController
  before_action :set_team_leader, only: [:show, :edit, :update, :destroy]

  # GET /team_leaders
  # GET /team_leaders.json
  def index
    @team_leaders = TeamLeader.all
  end

  # GET /team_leaders/1
  # GET /team_leaders/1.json
  def show
  end

  # GET /team_leaders/new
  def new
    @team_leader = TeamLeader.new
  end

  # GET /team_leaders/1/edit
  def edit
  end

  # POST /team_leaders
  # POST /team_leaders.json
  def create
    @team_leader = TeamLeader.new(team_leader_params)

    respond_to do |format|
      if @team_leader.save
        format.html { redirect_to @team_leader, notice: 'Team leader was successfully created.' }
        format.json { render :show, status: :created, location: @team_leader }
      else
        format.html { render :new }
        format.json { render json: @team_leader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_leaders/1
  # PATCH/PUT /team_leaders/1.json
  def update
    respond_to do |format|
      if @team_leader.update(team_leader_params)
        format.html { redirect_to @team_leader, notice: 'Team leader was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_leader }
      else
        format.html { render :edit }
        format.json { render json: @team_leader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_leaders/1
  # DELETE /team_leaders/1.json
  def destroy
    @team_leader.destroy
    respond_to do |format|
      format.html { redirect_to team_leaders_url, notice: 'Team leader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_leader
      @team_leader = TeamLeader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_leader_params
      params.require(:team_leader).permit(:name, :team_id)
    end
end
