class PostsController < ApplicationController
before_action :require_login

  def new
    @post = Post.new
    @post.sub_id = params[:sub_id]
    render 'new'
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update_attributes(post_params)
      render :show
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end

  end

  def show
    @post = Post.find_by(id: params[:id])
    render 'show'
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    sub_id = params[:sub_id]
    @post.destroy
    redirect_to sub_url(sub_id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id, :user_id)
  end

end
