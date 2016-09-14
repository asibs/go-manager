class SpeciesBaseStatsController < ApplicationController
  before_action :set_species_base_stat, only: [:show, :edit, :update, :destroy]

  # GET /species_base_stats
  # GET /species_base_stats.json
  def index
    @species_base_stats = SpeciesBaseStat.all
  end

  # GET /species_base_stats/1
  # GET /species_base_stats/1.json
  def show
  end

  # GET /species_base_stats/new
  def new
    @species_base_stat = SpeciesBaseStat.new
  end

  # GET /species_base_stats/1/edit
  def edit
  end

  # POST /species_base_stats
  # POST /species_base_stats.json
  def create
    @species_base_stat = SpeciesBaseStat.new(species_base_stat_params)

    respond_to do |format|
      if @species_base_stat.save
        format.html { redirect_to @species_base_stat, notice: 'Species base stat was successfully created.' }
        format.json { render :show, status: :created, location: @species_base_stat }
      else
        format.html { render :new }
        format.json { render json: @species_base_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /species_base_stats/1
  # PATCH/PUT /species_base_stats/1.json
  def update
    respond_to do |format|
      if @species_base_stat.update(species_base_stat_params)
        format.html { redirect_to @species_base_stat, notice: 'Species base stat was successfully updated.' }
        format.json { render :show, status: :ok, location: @species_base_stat }
      else
        format.html { render :edit }
        format.json { render json: @species_base_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /species_base_stats/1
  # DELETE /species_base_stats/1.json
  def destroy
    @species_base_stat.destroy
    respond_to do |format|
      format.html { redirect_to species_base_stats_url, notice: 'Species base stat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_species_base_stat
      @species_base_stat = SpeciesBaseStat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def species_base_stat_params
      params.require(:species_base_stat).permit(:monster_no, :base_attack, :base_defense, :base_stamina)
    end
end
