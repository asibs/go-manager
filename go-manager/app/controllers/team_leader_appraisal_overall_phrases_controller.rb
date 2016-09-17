class TeamLeaderAppraisalOverallPhrasesController < ApplicationController
  before_action :set_team_leader_appraisal_overall_phrase, only: [:show]

  # GET /team_leader_appraisal_overall_phrases
  # GET /team_leader_appraisal_overall_phrases.json
  def index
    @team_leader_appraisal_overall_phrases = TeamLeaderAppraisalOverallPhrase.all
  end

  # GET /team_leader_appraisal_overall_phrases/1
  # GET /team_leader_appraisal_overall_phrases/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_leader_appraisal_overall_phrase
      @team_leader_appraisal_overall_phrase = TeamLeaderAppraisalOverallPhrase.find(params[:id])
    end

end
