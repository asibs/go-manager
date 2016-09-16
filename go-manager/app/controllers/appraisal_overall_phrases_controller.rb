class AppraisalOverallPhrasesController < ApplicationController
  before_action :set_appraisal_overall_phrase, only: [:show]

  # GET /appraisal_overall_phrases
  # GET /appraisal_overall_phrases.json
  def index
    @appraisal_overall_phrases = AppraisalOverallPhrase.all
  end

  # GET /appraisal_overall_phrases/1
  # GET /appraisal_overall_phrases/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appraisal_overall_phrase
      @appraisal_overall_phrase = AppraisalOverallPhrase.find(params[:id])
    end
    
end
