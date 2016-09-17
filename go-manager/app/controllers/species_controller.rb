class SpeciesController < ApplicationController
  before_action :set_species, only: [:show]

  # GET /species
  # GET /species.json
  def index
    @species = Species.all
  end

  # GET /species/1
  # GET /species/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_species
      @species = Species.find(params[:id])
    end


end
