class PostsController < ApplicationController

  def index

  end

  def new
    @post = Post.new
    user_id = params[:user_id]
    @user = User.find_by(id: user_id)
  end

  def create
    user = User.find(params[:user_id])
    new_post = Post.new(post_params)
    if new_post.save
      user.posts << new_post
      redirect_to user_post_path(user, new_post)
    else
      flash[:error] = new_post.errors.full_messages.join(", ")
      redirect_to new_user_post_path(user)
    end
  end

  def show
    post_id = params[:id]
    @post = Post.find_by(id: post_id)
    user_id = params[:user_id]
    @user = User.find_by(id: user_id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
