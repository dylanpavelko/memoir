class ViewingPreferencesController < ApplicationController
  before_action :set_viewing_preference, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_user

  # GET /viewing_preferences
  # GET /viewing_preferences.json
  def index
    @viewing_preferences = ViewingPreference.all
  end

  # GET /viewing_preferences/1
  # GET /viewing_preferences/1.json
  def show
  end

  # GET /viewing_preferences/new
  def new
    @viewing_preference = ViewingPreference.new
    @group = Group.new
  end

  # GET /viewing_preferences/1/edit
  def edit
    @group = Group.new
  end

  # POST /viewing_preferences
  # POST /viewing_preferences.json
  def create
    @viewing_preference = ViewingPreference.new(viewing_preference_params)

    respond_to do |format|
      if @viewing_preference.save
        format.html { redirect_to @viewing_preference, notice: 'Viewing preference was successfully created.' }
        format.json { render :show, status: :created, location: @viewing_preference }
      else
        format.html { render :new }
        format.json { render json: @viewing_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /viewing_preferences/1
  # PATCH/PUT /viewing_preferences/1.json
  def update
    respond_to do |format|
      if @viewing_preference.update(viewing_preference_params)
        format.html { redirect_to @viewing_preference, notice: 'Viewing preference was successfully updated.' }
        format.json { render :show, status: :ok, location: @viewing_preference }
      else
        format.html { render :edit }
        format.json { render json: @viewing_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viewing_preferences/1
  # DELETE /viewing_preferences/1.json
  def destroy
    @viewing_preference.destroy
    respond_to do |format|
      format.html { redirect_to viewing_preferences_url, notice: 'Viewing preference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_viewing_preference
      @viewing_preference = ViewingPreference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def viewing_preference_params
      params.require(:viewing_preference).permit(:textDetailLevel, :imageDetailLevel, :characterTag, :storylineTag, :startDate, :endDate)
    end
end
