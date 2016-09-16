class AppraisalIndividualPhrasesController < ApplicationController
  before_action :set_appraisal_individual_phrase, only: [:show]

  # GET /appraisal_individual_phrases
  # GET /appraisal_individual_phrases.json
  def index
    @appraisal_individual_phrases = AppraisalIndividualPhrase.all
  end

  # GET /appraisal_individual_phrases/1
  # GET /appraisal_individual_phrases/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appraisal_individual_phrase
      @appraisal_individual_phrase = AppraisalIndividualPhrase.find(params[:id])
    end

end
