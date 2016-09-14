class MonsterPossibleIvsController < ApplicationController
  before_action :set_monster_possible_iv, only: [:show, :edit, :update, :destroy]

  # GET /monster_possible_ivs
  # GET /monster_possible_ivs.json
  def index
    @monster_possible_ivs = MonsterPossibleIv.all
  end

  # GET /monster_possible_ivs/1
  # GET /monster_possible_ivs/1.json
  def show
  end

  # GET /monster_possible_ivs/new
  def new
    @monster_possible_iv = MonsterPossibleIv.new
  end

  # GET /monster_possible_ivs/1/edit
  def edit
  end

  # POST /monster_possible_ivs
  # POST /monster_possible_ivs.json
  def create
    @monster_possible_iv = MonsterPossibleIv.new(monster_possible_iv_params)

    respond_to do |format|
      if @monster_possible_iv.save
        format.html { redirect_to @monster_possible_iv, notice: 'Monster possible iv was successfully created.' }
        format.json { render :show, status: :created, location: @monster_possible_iv }
      else
        format.html { render :new }
        format.json { render json: @monster_possible_iv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_possible_ivs/1
  # PATCH/PUT /monster_possible_ivs/1.json
  def update
    respond_to do |format|
      if @monster_possible_iv.update(monster_possible_iv_params)
        format.html { redirect_to @monster_possible_iv, notice: 'Monster possible iv was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster_possible_iv }
      else
        format.html { render :edit }
        format.json { render json: @monster_possible_iv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_possible_ivs/1
  # DELETE /monster_possible_ivs/1.json
  def destroy
    @monster_possible_iv.destroy
    respond_to do |format|
      format.html { redirect_to monster_possible_ivs_url, notice: 'Monster possible iv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_possible_iv
      @monster_possible_iv = MonsterPossibleIv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_possible_iv_params
      params.require(:monster_possible_iv).permit(:monster_id, :level_id, :attack, :defense, :stamina, :maxed_cp, :maxed_hp)
    end
end
