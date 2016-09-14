class AppraisalOverallPhrasesController < ApplicationController
  before_action :set_appraisal_overall_phrase, only: [:show, :edit, :update, :destroy]

  # GET /appraisal_overall_phrases
  # GET /appraisal_overall_phrases.json
  def index
    @appraisal_overall_phrases = AppraisalOverallPhrase.all
  end

  # GET /appraisal_overall_phrases/1
  # GET /appraisal_overall_phrases/1.json
  def show
  end

  # GET /appraisal_overall_phrases/new
  def new
    @appraisal_overall_phrase = AppraisalOverallPhrase.new
  end

  # GET /appraisal_overall_phrases/1/edit
  def edit
  end

  # POST /appraisal_overall_phrases
  # POST /appraisal_overall_phrases.json
  def create
    @appraisal_overall_phrase = AppraisalOverallPhrase.new(appraisal_overall_phrase_params)

    respond_to do |format|
      if @appraisal_overall_phrase.save
        format.html { redirect_to @appraisal_overall_phrase, notice: 'Appraisal overall phrase was successfully created.' }
        format.json { render :show, status: :created, location: @appraisal_overall_phrase }
      else
        format.html { render :new }
        format.json { render json: @appraisal_overall_phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appraisal_overall_phrases/1
  # PATCH/PUT /appraisal_overall_phrases/1.json
  def update
    respond_to do |format|
      if @appraisal_overall_phrase.update(appraisal_overall_phrase_params)
        format.html { redirect_to @appraisal_overall_phrase, notice: 'Appraisal overall phrase was successfully updated.' }
        format.json { render :show, status: :ok, location: @appraisal_overall_phrase }
      else
        format.html { render :edit }
        format.json { render json: @appraisal_overall_phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appraisal_overall_phrases/1
  # DELETE /appraisal_overall_phrases/1.json
  def destroy
    @appraisal_overall_phrase.destroy
    respond_to do |format|
      format.html { redirect_to appraisal_overall_phrases_url, notice: 'Appraisal overall phrase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appraisal_overall_phrase
      @appraisal_overall_phrase = AppraisalOverallPhrase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appraisal_overall_phrase_params
      params.require(:appraisal_overall_phrase, :phrase, :min_total_iv, :max_total_iv, :team_leader_id)
    end
end
