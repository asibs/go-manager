class LevelsDataController < ApplicationController
  before_action :set_levels_datum, only: [:show]

  # GET /levels_data
  # GET /levels_data.json
  def index
    @levels_data = LevelsDatum.all
  end

  # GET /levels_data/1
  # GET /levels_data/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_levels_datum
      @levels_datum = LevelsDatum.find(params[:id])
    end

end
