class Admin::UsersController < Admin::ApplicationController
  
  before_filter :restrict_access

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def destroy
    @user = User.find(params[:id])
    UserMailer.delete_email(@user).deliver_now  
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_path }
      format.json { head :no_content }
    end
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

end


