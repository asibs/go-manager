class MonsterLevelsController < ApplicationController
  before_action :set_monster_level, only: [:show, :edit, :update, :destroy]

  # GET /monster_levels
  # GET /monster_levels.json
  def index
    @monster_levels = MonsterLevel.all
  end

  # GET /monster_levels/1
  # GET /monster_levels/1.json
  def show
  end

  # GET /monster_levels/new
  def new
    @monster_level = MonsterLevel.new
  end

  # GET /monster_levels/1/edit
  def edit
  end

  # POST /monster_levels
  # POST /monster_levels.json
  def create
    @monster_level = MonsterLevel.new(monster_level_params)

    respond_to do |format|
      if @monster_level.save
        format.html { redirect_to @monster_level, notice: 'Monster level was successfully created.' }
        format.json { render :show, status: :created, location: @monster_level }
      else
        format.html { render :new }
        format.json { render json: @monster_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_levels/1
  # PATCH/PUT /monster_levels/1.json
  def update
    respond_to do |format|
      if @monster_level.update(monster_level_params)
        format.html { redirect_to @monster_level, notice: 'Monster level was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster_level }
      else
        format.html { render :edit }
        format.json { render json: @monster_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_levels/1
  # DELETE /monster_levels/1.json
  def destroy
    @monster_level.destroy
    respond_to do |format|
      format.html { redirect_to monster_levels_url, notice: 'Monster level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_level
      @monster_level = MonsterLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_level_params
      params.require(:monster_level).permit(:cp, :hp, :dust_to_power_up, :never_powered_up)
    end
end
