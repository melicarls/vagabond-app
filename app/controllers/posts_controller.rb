class PostsController < ApplicationController

  def index

  end

  def new
    if !active?
      flash[:notification] = "Please reactivate your account to continue"
      redirect_to edit_user_path(@current_user)
    else
      @post = Post.new
      city_id = params[:city_id]
      @city = City.find_by(id: city_id)
      render :new
    end
  end

  def create
    if !active?
      flash[:notification] = "Please reactivate your account to continue"
      redirect_to edit_user_path(@current_user)
    else
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
  end

  def show
    if !active?
      flash[:notification] = "Please reactivate your account to continue"
      redirect_to edit_user_path(@current_user)
    else
      post_id = params[:id]
      @post = Post.find_by(id: post_id)
      city_id = params[:city_id]
      @city = City.find_by(id: city_id)
    end
  end

  def edit
    if !active?
      flash[:notification] = "Please reactivate your account to continue"
      redirect_to edit_user_path(@current_user)
    else
      post_id = params[:id]
      @post = Post.find_by(id: post_id)
      city_id = params[:city_id]
      @city = City.find_by(id: city_id)
      render :edit
    end
  end

  def update
    if !active?
      flash[:notification] = "Please reactivate your account to continue"
      redirect_to edit_user_path(@current_user)
    else
      city = City.find(params[:city_id])
      post_id = params[:id]
      post = Post.find_by(id: post_id)
      user_id = current_user[:id]
      post[:user_id] = user_id
      if post.update(post_params)
        flash[:notice] = "Post successfully updated!"
        redirect_to city_path(city)
      else
        flash[:error] = post.errors.full_messages.join(", ")
        redirect_to edit_post_path
      end
    end
  end

  def destroy
    if !active?
      flash[:notification] = "Please reactivate your account to continue"
      redirect_to edit_user_path(@current_user)
    else
      post_id = params[:id]
      post = Post.find_by(id: post_id)
      post.destroy
      city_id = params[:city_id]
      city = City.find_by(id: city_id)
      redirect_to city_path(city)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
