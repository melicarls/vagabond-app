class PostsController < ApplicationController

  def index

  end

  def new
    @post = Post.new
    city_id = params[:city_id]
    @city = City.find_by(id: city_id)
    render :new
  end

  def create
    city = City.find(params[:city_id])
    new_post = Post.new(post_params)
    user_id = current_user[:id]
    new_post[:user_id] = user_id
    if new_post.save
      city.posts << new_post
      redirect_to city_path(city)
    else
      flash[:error] = new_post.errors.full_messages.join(", ")
      redirect_to new_user_post_path(user)
    end
  end

  def show
    post_id = params[:id]
    @post = Post.find_by(id: post_id)
    city_id = params[:city_id]
    @city = City.find_by(id: city_id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
