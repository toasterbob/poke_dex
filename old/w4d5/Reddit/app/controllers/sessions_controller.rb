class SessionsController < ApplicationController

  def new
    render 'new'
  end

  def create
    @user = User.find_by_credentials(
      session_params[:username],
      session_params[:password]
    )
    if @user
      login(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = ["invalid credentials!"]
      render 'new'
    end
  end

  def destroy
    logout
    current_user.reset_session_token!
    redirect_to new_sessions_url
  end


  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
