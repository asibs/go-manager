class MonsterSummariesController < ApplicationController
  before_action :set_monster_summary, only: [:show, :edit, :update, :destroy]

  # GET /monster_summaries
  # GET /monster_summaries.json
  def index
    @monster_summaries = MonsterSummary.all
  end

  # GET /monster_summaries/1
  # GET /monster_summaries/1.json
  def show
  end

  # GET /monster_summaries/new
  def new
    @monster_summary = MonsterSummary.new
  end

  # GET /monster_summaries/1/edit
  def edit
  end

  # POST /monster_summaries
  # POST /monster_summaries.json
  def create
    @monster_summary = MonsterSummary.new(monster_summary_params)

    respond_to do |format|
      if @monster_summary.save
        format.html { redirect_to @monster_summary, notice: 'Monster summary was successfully created.' }
        format.json { render :show, status: :created, location: @monster_summary }
      else
        format.html { render :new }
        format.json { render json: @monster_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_summaries/1
  # PATCH/PUT /monster_summaries/1.json
  def update
    respond_to do |format|
      if @monster_summary.update(monster_summary_params)
        format.html { redirect_to @monster_summary, notice: 'Monster summary was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster_summary }
      else
        format.html { render :edit }
        format.json { render json: @monster_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_summaries/1
  # DELETE /monster_summaries/1.json
  def destroy
    @monster_summary.destroy
    respond_to do |format|
      format.html { redirect_to monster_summaries_url, notice: 'Monster summary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_summary
      @monster_summary = MonsterSummary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_summary_params
      params.require(:monster_summary).permit(:min_attack_iv, :max_attack_iv, :min_defense_iv, :max_attack_iv, :min_stamina_iv, :max_stamina_iv, :min_maxed_cp, :max_maxed_cp, :min_maxed_hp, :max_maxed_hp)
    end
end
