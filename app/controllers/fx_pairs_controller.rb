class FxPairsController < ApplicationController
  before_action :set_fx_pair, only: [:show, :edit, :update, :destroy]

  # GET /fx_pairs
  # GET /fx_pairs.json
  def index
    @fx_pairs = FxPair.all
  end

  # GET /fx_pairs/1
  # GET /fx_pairs/1.json
  def show
  end

  # GET /fx_pairs/new
  def new
    @fx_pair = FxPair.new
  end

  # GET /fx_pairs/1/edit
  def edit
  end

  # POST /fx_pairs
  # POST /fx_pairs.json
  def create
    @fx_pair = FxPair.new(fx_pair_params)

    respond_to do |format|
      if @fx_pair.save
        format.html { redirect_to @fx_pair, notice: 'Fx pair was successfully created.' }
        format.json { render :show, status: :created, location: @fx_pair }
      else
        format.html { render :new }
        format.json { render json: @fx_pair.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fx_pairs/1
  # PATCH/PUT /fx_pairs/1.json
  def update
    respond_to do |format|
      if @fx_pair.update(fx_pair_params)
        format.html { redirect_to @fx_pair, notice: 'Fx pair was successfully updated.' }
        format.json { render :show, status: :ok, location: @fx_pair }
      else
        format.html { render :edit }
        format.json { render json: @fx_pair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fx_pairs/1
  # DELETE /fx_pairs/1.json
  def destroy
    @fx_pair.destroy
    respond_to do |format|
      format.html { redirect_to fx_pairs_url, notice: 'Fx pair was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fx_pair
      @fx_pair = FxPair.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fx_pair_params
      params.require(:fx_pair).permit(:base, :target, :rate, :last_updated_at)
    end
end
