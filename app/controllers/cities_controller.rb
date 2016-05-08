class CitiesController < ApplicationController

  def index
    return if inactive_redirect
    @cities = City.all
    render :index
  end

  def new
    return if inactive_redirect
    @city = City.new
    render :new
  end

  def show
    return if inactive_redirect
    @city = City.find_by_id(params[:id])
    posts = Post.all
    @active_user_posts = []
    posts.each do |post|
      if post.user[:active]
        @active_user_posts << post
      end
    end
    @active_user_posts.sort_by{|e| e[:created_at]}
  end


  def create
    return if inactive_redirect
    @city = City.new(city_params)
    if @city.save
      flash[:success] = "Created new city."
      redirect_to @city
    else
      flash[:error] = @city.errors.full_messages.join(", ")
      redirect_to new_city_path
    end
  end



# Restrict to Admin account
  def edit
    return if inactive_redirect
    if @current_user[:username] != "admin"
      redirect_to cities_path
      flash[:error] = "You're not authorized to edit a city."
    else
      @city = City.find_by_id(params[:id])
      render :edit
    end
  end


  def update
    return if inactive_redirect
    if @current_user[:username] != "admin"
      redirect_to cities_path
      flash[:error] = "You're not authorized to edit a city."
    else
      @city = City.find_by_id(params[:id])
      if @city.update(city_params)
        flash[:success] = "Successfully updated city."
        redirect_to @city
      else
        flash[:error] = @city.errors.full_messages.join(", ")
        redirect_to edit_city_path(@city)
      end
    end
  end


  def destroy
    if @current_user[:username] != "admin"
      redirect_to cities_path
      flash[:error] = "You're not authorized to delete a city."
    else
      @city = City.find_by_id(params[:id])
      if @city.destroy
        flash[:success] = "The city has been deleted."
        redirect_to cities_path
      else
        flash[:error] = @city.errors.full_messages.join(", ")
        redirect_to edit_city_path(@city)
      end
    end
  end



  private

  def city_params
    params.require(:city).permit(:name, :photo)
  end

end
