class MonsterAppraisalsController < ApplicationController
  before_action :set_monster_appraisal, only: [:show, :edit, :update, :destroy]

  # GET /monster_appraisals
  # GET /monster_appraisals.json
  def index
    @monster_appraisals = MonsterAppraisal.all
  end

  # GET /monster_appraisals/1
  # GET /monster_appraisals/1.json
  def show
  end

  # GET /monster_appraisals/new
  def new
    @monster_appraisal = MonsterAppraisal.new
  end

  # GET /monster_appraisals/1/edit
  def edit
  end

  # POST /monster_appraisals
  # POST /monster_appraisals.json
  def create
    @monster_appraisal = MonsterAppraisal.new(monster_appraisal_params)

    respond_to do |format|
      if @monster_appraisal.save
        format.html { redirect_to @monster_appraisal, notice: 'Monster appraisal was successfully created.' }
        format.json { render :show, status: :created, location: @monster_appraisal }
      else
        format.html { render :new }
        format.json { render json: @monster_appraisal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_appraisals/1
  # PATCH/PUT /monster_appraisals/1.json
  def update
    respond_to do |format|
      if @monster_appraisal.update(monster_appraisal_params)
        format.html { redirect_to @monster_appraisal, notice: 'Monster appraisal was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster_appraisal }
      else
        format.html { render :edit }
        format.json { render json: @monster_appraisal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_appraisals/1
  # DELETE /monster_appraisals/1.json
  def destroy
    @monster_appraisal.destroy
    respond_to do |format|
      format.html { redirect_to monster_appraisals_url, notice: 'Monster appraisal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_appraisal
      @monster_appraisal = MonsterAppraisal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_appraisal_params
      params.require(:monster_appraisal).permit(:monster_id, :appraisal_overall_phrase_id, :attack_best, :defense_best, :stamina_best, :appraisal_individual_phrase_id)
    end
end
