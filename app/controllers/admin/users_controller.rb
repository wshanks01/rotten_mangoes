class Admin::UsersController < Admin::ApplicationController
  
  before_filter :restrict_access

  def index
    @user = User.all.page(params[:page]).per(10)
  end

end


