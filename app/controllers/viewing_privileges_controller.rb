class ViewingPrivilegesController < ApplicationController
  before_action :set_viewing_privilege, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user

  # GET /viewing_privileges
  # GET /viewing_privileges.json
  def index
    @viewing_privileges = ViewingPrivilege.all
  end

  # GET /viewing_privileges/1
  # GET /viewing_privileges/1.json
  def show
  end

  # GET /viewing_privileges/new
  def new
    @viewing_privilege = ViewingPrivilege.new
  end

  # GET /viewing_privileges/1/edit
  def edit
  end

  # POST /viewing_privileges
  # POST /viewing_privileges.json
  def create
    @viewing_privilege = ViewingPrivilege.new(viewing_privilege_params)

    respond_to do |format|
      if @viewing_privilege.save
        @viewing_privilege.update(:characterTag_id => params[:characterTag_id][:id], :storylineTag_id => params[:storylineTag_id][:id])
        format.html { redirect_to @viewing_privilege, notice: 'Viewing privilege was successfully created.' }
        format.json { render :show, status: :created, location: @viewing_privilege }
      else
        format.html { render :new }
        format.json { render json: @viewing_privilege.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /viewing_privileges/1
  # PATCH/PUT /viewing_privileges/1.json
  def update
    respond_to do |format|
      if @viewing_privilege.update(viewing_privilege_params)
        @viewing_privilege.update(:characterTag_id => params[:characterTag_id][:id], :storylineTag_id => params[:storylineTag_id][:id])
        format.html { redirect_to @viewing_privilege, notice: 'Viewing privilege was successfully updated.' }
        format.json { render :show, status: :ok, location: @viewing_privilege }
      else
        format.html { render :edit }
        format.json { render json: @viewing_privilege.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viewing_privileges/1
  # DELETE /viewing_privileges/1.json
  def destroy
    @viewing_privilege.destroy
    respond_to do |format|
      format.html { redirect_to viewing_privileges_url, notice: 'Viewing privilege was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_viewing_privilege
      @viewing_privilege = ViewingPrivilege.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def viewing_privilege_params
      params.require(:viewing_privilege).permit(:name, :characterTag_id, :storylineTag_id, :startDate, :endDate)
    end
end
