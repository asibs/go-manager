class LevelsDataController < ApplicationController
  before_action :set_levels_datum, only: [:show, :edit, :update, :destroy]

  # GET /levels_data
  # GET /levels_data.json
  def index
    @levels_data = LevelsDatum.all
  end

  # GET /levels_data/1
  # GET /levels_data/1.json
  def show
  end

  # GET /levels_data/new
  def new
    @levels_datum = LevelsDatum.new
  end

  # GET /levels_data/1/edit
  def edit
  end

  # POST /levels_data
  # POST /levels_data.json
  def create
    @levels_datum = LevelsDatum.new(levels_datum_params)

    respond_to do |format|
      if @levels_datum.save
        format.html { redirect_to @levels_datum, notice: 'Levels datum was successfully created.' }
        format.json { render :show, status: :created, location: @levels_datum }
      else
        format.html { render :new }
        format.json { render json: @levels_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /levels_data/1
  # PATCH/PUT /levels_data/1.json
  def update
    respond_to do |format|
      if @levels_datum.update(levels_datum_params)
        format.html { redirect_to @levels_datum, notice: 'Levels datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @levels_datum }
      else
        format.html { render :edit }
        format.json { render json: @levels_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /levels_data/1
  # DELETE /levels_data/1.json
  def destroy
    @levels_datum.destroy
    respond_to do |format|
      format.html { redirect_to levels_data_url, notice: 'Levels datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_levels_datum
      @levels_datum = LevelsDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def levels_datum_params
      params.require(:levels_datum).permit(:level, :level, :cp_multiplier, :cp_multiplier, :stardust_to_power_up, :candy_to_power_up)
    end
end
