class MonstersController < ApplicationController
  before_action :set_monster, only: [:show, :edit, :update, :destroy]
  before_action :set_species

  # GET /monsters
  # GET /monsters.json
  def index
    @monsters = @current_user.monsters
  end

  # GET /monsters/1
  # GET /monsters/1.json
  def show
  end

  # GET /monsters/new
  def new
    @monster = Monster.new
    @monster.monster_evolutions.build
  end

  # GET /monsters/1/edit
  def edit
  end

  # POST /monsters
  # POST /monsters.json
  def create
    @monster = @current_user.monsters.build(monster_params)

    respond_to do |format|
      if @monster.save
        format.html { redirect_to @monster, notice: 'Monster was successfully created.' }
        format.json { render :show, status: :created, location: @monster }
      else
        format.html { render :new }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monsters/1
  # PATCH/PUT /monsters/1.json
  def update
    respond_to do |format|
      if @monster.update(monster_params)
        format.html { redirect_to @monster, notice: 'Monster was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster }
      else
        format.html { render :edit }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monsters/1
  # DELETE /monsters/1.json
  def destroy
    @monster.destroy
    respond_to do |format|
      format.html { redirect_to monsters_url, notice: 'Monster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster
      # Find based on slug AND the logged in user ID to ensure this user owns this monster
      @monster = Monster.find_by(slug: params[:slug], user_id: @current_user.id)
    end

    def set_species
      @species = Species.cached_all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_params
      #params.require(:monster).permit(:name, monster_evolutions_attributes: [:id, :species_id])
      params.require(:monster).permit(:name, monster_evolutions_attributes: [:species_id])
    end
end
