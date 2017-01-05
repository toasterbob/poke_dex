class SubsController < ApplicationController
  before_action :require_login

  def index
    @subs = Sub.all
    render 'index'
  end

  def new
    render 'new'
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      render :show
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    if @sub.update_attributes(sub_params)
      render :show
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end

  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render 'show'
  end

  def destroy
    @sub = Sub.find_by(id: params[:id])
    @sub.destroy
    render :index
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description, :user_id)
  end


end
