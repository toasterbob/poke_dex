class UsersController < ApplicationController

  def show

  end

  def create
    user = User.new(user_params)
    if user.save
      log_in(user)
      redirect_to links_url
    else
      flash[:errors] = "WTF"
      render :new
    end
  end

  def new
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
