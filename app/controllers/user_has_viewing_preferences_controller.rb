class UserHasViewingPreferencesController < ApplicationController
  before_action :set_user_has_viewing_preference, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_user

  # GET /user_has_viewing_preferences
  # GET /user_has_viewing_preferences.json
  def index
    @user_has_viewing_preferences = UserHasViewingPreference.all
  end

  # GET /user_has_viewing_preferences/1
  # GET /user_has_viewing_preferences/1.json
  def show
  end

  # GET /user_has_viewing_preferences/new
  def new
    @user_has_viewing_preference = UserHasViewingPreference.new
  end

  # GET /user_has_viewing_preferences/1/edit
  def edit
  end

  # POST /user_has_viewing_preferences
  # POST /user_has_viewing_preferences.json
  def create
    @user_has_viewing_preference = UserHasViewingPreference.new(user_has_viewing_preference_params)

    respond_to do |format|
      if @user_has_viewing_preference.save
        format.html { redirect_to @user_has_viewing_preference, notice: 'User has viewing preference was successfully created.' }
        format.json { render :show, status: :created, location: @user_has_viewing_preference }
      else
        format.html { render :new }
        format.json { render json: @user_has_viewing_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_has_viewing_preferences/1
  # PATCH/PUT /user_has_viewing_preferences/1.json
  def update
    respond_to do |format|
      if @user_has_viewing_preference.update(user_has_viewing_preference_params)
        format.html { redirect_to @user_has_viewing_preference, notice: 'User has viewing preference was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_has_viewing_preference }
      else
        format.html { render :edit }
        format.json { render json: @user_has_viewing_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_has_viewing_preferences/1
  # DELETE /user_has_viewing_preferences/1.json
  def destroy
    @user_has_viewing_preference.destroy
    respond_to do |format|
      format.html { redirect_to user_has_viewing_preferences_url, notice: 'User has viewing preference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_has_viewing_preference
      @user_has_viewing_preference = UserHasViewingPreference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_has_viewing_preference_params
      params.require(:user_has_viewing_preference).permit(:user_id, :viewingPreference_id)
    end
end
