class SpeciesBaseStatsController < ApplicationController
  before_action :set_species_base_stat, only: [:show]

  # GET /species_base_stats
  # GET /species_base_stats.json
  def index
    @species_base_stats = SpeciesBaseStat.all
  end

  # GET /species_base_stats/1
  # GET /species_base_stats/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_species_base_stat
      @species_base_stat = SpeciesBaseStat.find(params[:id])
    end

end
