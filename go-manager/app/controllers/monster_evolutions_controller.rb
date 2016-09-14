class MonsterEvolutionsController < ApplicationController
  before_action :set_monster_evolution, only: [:show, :edit, :update, :destroy]

  # GET /monster_evolutions
  # GET /monster_evolutions.json
  def index
    @monster_evolutions = MonsterEvolution.all
  end

  # GET /monster_evolutions/1
  # GET /monster_evolutions/1.json
  def show
  end

  # GET /monster_evolutions/new
  def new
    @monster_evolution = MonsterEvolution.new
  end

  # GET /monster_evolutions/1/edit
  def edit
  end

  # POST /monster_evolutions
  # POST /monster_evolutions.json
  def create
    @monster_evolution = MonsterEvolution.new(monster_evolution_params)

    respond_to do |format|
      if @monster_evolution.save
        format.html { redirect_to @monster_evolution, notice: 'Monster evolution was successfully created.' }
        format.json { render :show, status: :created, location: @monster_evolution }
      else
        format.html { render :new }
        format.json { render json: @monster_evolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_evolutions/1
  # PATCH/PUT /monster_evolutions/1.json
  def update
    respond_to do |format|
      if @monster_evolution.update(monster_evolution_params)
        format.html { redirect_to @monster_evolution, notice: 'Monster evolution was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster_evolution }
      else
        format.html { render :edit }
        format.json { render json: @monster_evolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_evolutions/1
  # DELETE /monster_evolutions/1.json
  def destroy
    @monster_evolution.destroy
    respond_to do |format|
      format.html { redirect_to monster_evolutions_url, notice: 'Monster evolution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_evolution
      @monster_evolution = MonsterEvolution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_evolution_params
      params.require(:monster_evolution).permit(:monster_id, :species_id)
    end
end
