class Admin::ApplicationController < ActionController::Base

  private

  def restrict_access
    if current_user && !current_user.admin?
      redirect_to new_session_path, notice: "You must log in."
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
