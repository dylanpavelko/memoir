class UsersController < ApplicationController  
before_filter :save_login_state, :only => [:new, :create]
before_filter :authenticate_user, :only => [:edit, :index]
before_action :set_user, only: [:show, :edit, :update, :destroy]
#before_filter :author_only, only: [:index, :show, :update, :destroy]
  

  def index
    @users = User.all
  end


  def new
    @user = User.new 
  end
  
  def edit
  end


  def create
    @user = User.new(user_params)
    if @user.update_attribute(:role_id, 2)
      session[:user_id] = @user.id
      redirect_to(root_path)
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render "new"
    end

  end

  def show
  end


  def update
    respond_to do |format|
      if @user.update(user_params)
        @user.update(:role_id => params[:role_id][:id])
        format.html { redirect_to users_path, notice: 'Viewing privilege was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_last_group_viewed
      @user.update(:last_group_viewed => params[:last_group_viewed])
    end



 def user_params
    params.require(:user).permit(:username, :email, :firstName, :lastName, :password, :role_id, :password_confirmation)
  end
end