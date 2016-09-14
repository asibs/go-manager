class AppraisalIndividualPhrasesController < ApplicationController
  before_action :set_appraisal_individual_phrase, only: [:show, :edit, :update, :destroy]

  # GET /appraisal_individual_phrases
  # GET /appraisal_individual_phrases.json
  def index
    @appraisal_individual_phrases = AppraisalIndividualPhrase.all
  end

  # GET /appraisal_individual_phrases/1
  # GET /appraisal_individual_phrases/1.json
  def show
  end

  # GET /appraisal_individual_phrases/new
  def new
    @appraisal_individual_phrase = AppraisalIndividualPhrase.new
  end

  # GET /appraisal_individual_phrases/1/edit
  def edit
  end

  # POST /appraisal_individual_phrases
  # POST /appraisal_individual_phrases.json
  def create
    @appraisal_individual_phrase = AppraisalIndividualPhrase.new(appraisal_individual_phrase_params)

    respond_to do |format|
      if @appraisal_individual_phrase.save
        format.html { redirect_to @appraisal_individual_phrase, notice: 'Appraisal individual phrase was successfully created.' }
        format.json { render :show, status: :created, location: @appraisal_individual_phrase }
      else
        format.html { render :new }
        format.json { render json: @appraisal_individual_phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appraisal_individual_phrases/1
  # PATCH/PUT /appraisal_individual_phrases/1.json
  def update
    respond_to do |format|
      if @appraisal_individual_phrase.update(appraisal_individual_phrase_params)
        format.html { redirect_to @appraisal_individual_phrase, notice: 'Appraisal individual phrase was successfully updated.' }
        format.json { render :show, status: :ok, location: @appraisal_individual_phrase }
      else
        format.html { render :edit }
        format.json { render json: @appraisal_individual_phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appraisal_individual_phrases/1
  # DELETE /appraisal_individual_phrases/1.json
  def destroy
    @appraisal_individual_phrase.destroy
    respond_to do |format|
      format.html { redirect_to appraisal_individual_phrases_url, notice: 'Appraisal individual phrase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appraisal_individual_phrase
      @appraisal_individual_phrase = AppraisalIndividualPhrase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appraisal_individual_phrase_params
      params.require(:appraisal_individual_phrase, :phrase, :min_individual_iv, :max_individual_iv, :team_leader_id)
    end
end
