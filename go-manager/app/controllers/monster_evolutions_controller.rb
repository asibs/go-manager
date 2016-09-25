class MonsterEvolutionsController < ApplicationController
  before_action :set_monster, only: [:index, :new, :create]
  before_action :set_monster_evolution, only: [:show, :edit, :update, :destroy]

  # GET /monster_evolutions
  # GET /monster_evolutions.json
  def index
    @monster_evolutions = @monster.monster_evolution
  end

  # GET /monster_evolutions/1
  # GET /monster_evolutions/1.json
  def show
  end

  # GET /monster_evolutions/new
  def new
    @monster_evolution = @monster.monster_evolution.build
  end

  # GET /monster_evolutions/1/edit
  def edit
  end

  # POST /monster_evolutions
  # POST /monster_evolutions.json
  def create
    @monster_evolution = @monster.monster_evolution.build(monster_evolution_params)

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
      format.html { redirect_to monster_monster_evolutions_url(@monster_evolution.monster), notice: 'Monster evolution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster
      # Find based on slug AND the logged in user ID to ensure this user owns this monster
      @monster = Monster.find_by(slug: params[:monster_slug], user_id: @current_user.id)
    end

    def set_monster_evolution
      monster_evolution = MonsterEvolution.find_by(slug: params[:slug])
      if monster_evolution.monster.user_id = @current_user.id
        @monster_evolution = monster_evolution
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_evolution_params
      params.require(:monster_evolution).permit(:monster_id, :species_id)
    end
end
