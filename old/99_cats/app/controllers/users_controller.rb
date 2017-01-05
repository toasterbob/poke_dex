class UsersController < ApplicationController
  before_action :cats_redirect

  def new
    render :new
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      render :new
    else
      render :show
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      msg = UserMailer.welcome_email(user)
      msg.deliver_now
      log_in(user)
      redirect_to user_url(user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

  def cats_redirect
    if current_user && params[:action] == "new"
      redirect_to cats_url
    end
  end

end
