class SessionsController < ApplicationController
  before_action :cats_redirect

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
        session_params[:user_name],
        session_params[:password])
    if user
      user.reset_session_token!
      log_in(user)
      redirect_to cats_url
    else
      render :new
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
    end
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:user_name, :password)
  end

  def cats_redirect
    if current_user && params[:action] == "new"
      redirect_to cats_url
    end
  end

end
