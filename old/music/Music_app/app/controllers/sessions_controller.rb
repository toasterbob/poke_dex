class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    #login
    user = User.find_by_credentials(
            session_params[:email],
            session_params[:password]
            )
    if user
      log_in(user)
      redirect_to user_url(user)
    else
      render :new
    end
  end

  def destroy
    log_out
    render :new
  end

private

  def session_params
    params.require(:user).permit(:email, :password)
  end

end
