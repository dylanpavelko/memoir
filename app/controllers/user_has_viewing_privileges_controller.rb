class UserHasViewingPrivilegesController < ApplicationController
  before_action :set_user_has_viewing_privilege, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user

  # GET /user_has_viewing_privileges
  # GET /user_has_viewing_privileges.json
  def index
    @user_has_viewing_privileges = UserHasViewingPrivilege.all
  end

  # GET /user_has_viewing_privileges/1
  # GET /user_has_viewing_privileges/1.json
  def show
  end

  # GET /user_has_viewing_privileges/new
  def new
    @user_has_viewing_privilege = UserHasViewingPrivilege.new
  end

  # GET /user_has_viewing_privileges/1/edit
  def edit
  end

  # POST /user_has_viewing_privileges
  # POST /user_has_viewing_privileges.json
  def create
    @user_has_viewing_privilege = UserHasViewingPrivilege.new(user_has_viewing_privilege_params)

    respond_to do |format|
      if @user_has_viewing_privilege.save
        format.html { redirect_to @user_has_viewing_privilege, notice: 'User has viewing privilege was successfully created.' }
        format.json { render :show, status: :created, location: @user_has_viewing_privilege }
      else
        format.html { render :new }
        format.json { render json: @user_has_viewing_privilege.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_has_viewing_privileges/1
  # PATCH/PUT /user_has_viewing_privileges/1.json
  def update
    respond_to do |format|
      if @user_has_viewing_privilege.update(user_has_viewing_privilege_params)
        format.html { redirect_to @user_has_viewing_privilege, notice: 'User has viewing privilege was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_has_viewing_privilege }
      else
        format.html { render :edit }
        format.json { render json: @user_has_viewing_privilege.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_has_viewing_privileges/1
  # DELETE /user_has_viewing_privileges/1.json
  def destroy
    @user_has_viewing_privilege.destroy
    respond_to do |format|
      format.html { redirect_to user_has_viewing_privileges_url, notice: 'User has viewing privilege was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_has_viewing_privilege
      @user_has_viewing_privilege = UserHasViewingPrivilege.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_has_viewing_privilege_params
      params.require(:user_has_viewing_privilege).permit(:user_id, :viewingPrivilege_id)
    end
end
