class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user != nil
  end

  def require_login
    redirect_to login_path, alert: 'Please log in to continue.' unless logged_in?
  end

end
