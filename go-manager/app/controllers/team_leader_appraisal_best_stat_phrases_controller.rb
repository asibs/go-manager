class TeamLeaderAppraisalBestStatPhrasesController < ApplicationController
  before_action :set_team_leader_appraisal_best_stat_phrase, only: [:show]

  # GET /team_leader_appraisal_best_stat_phrases
  # GET /team_leader_appraisal_best_stat_phrases.json
  def index
    @team_leader_appraisal_best_stat_phrases = TeamLeaderAppraisalBestStatPhrase.all
  end

  # GET /team_leader_appraisal_best_stat_phrases/1
  # GET /team_leader_appraisal_best_stat_phrases/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_leader_appraisal_best_stat_phrase
      @team_leader_appraisal_best_stat_phrase = TeamLeaderAppraisalBestStatPhrase.find(params[:id])
    end


end
