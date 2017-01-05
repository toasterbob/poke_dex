class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :require_login

  def login(user)
    session[:session_token] = user.session_token
    user
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
    @current_user
  end

  def logout
    return if current_user.nil?
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    unless logged_in?
      flash[:errors] = ["You have to be logged_in to do that"]
      redirect_to new_sessions_url
    end
  end

end
