class DetailLevelsController < ApplicationController
  before_action :set_detail_level, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user
  before_filter :author_only

  # GET /detail_levels
  # GET /detail_levels.json
  def index
    @detail_levels = DetailLevel.all
  end

  # GET /detail_levels/1
  # GET /detail_levels/1.json
  def show
  end

  # GET /detail_levels/new
  def new
    @detail_level = DetailLevel.new
  end

  # GET /detail_levels/1/edit
  def edit
  end

  # POST /detail_levels
  # POST /detail_levels.json
  def create
    @detail_level = DetailLevel.new(detail_level_params)

    respond_to do |format|
      if @detail_level.save
        format.html { redirect_to @detail_level, notice: 'Detail level was successfully created.' }
        format.json { render :show, status: :created, location: @detail_level }
      else
        format.html { render :new }
        format.json { render json: @detail_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detail_levels/1
  # PATCH/PUT /detail_levels/1.json
  def update
    respond_to do |format|
      if @detail_level.update(detail_level_params)
        format.html { redirect_to @detail_level, notice: 'Detail level was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail_level }
      else
        format.html { render :edit }
        format.json { render json: @detail_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detail_levels/1
  # DELETE /detail_levels/1.json
  def destroy
    @detail_level.destroy
    respond_to do |format|
      format.html { redirect_to detail_levels_url, notice: 'Detail level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail_level
      @detail_level = DetailLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_level_params
      params.require(:detail_level).permit(:name)
    end
end
