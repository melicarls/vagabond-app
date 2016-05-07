class CitiesController < ApplicationController

  def index
    @cities = City.all
    render :index
  end

  def new
    @city = City.new
    render :new
  end

  def show
    @city = City.find_by_id(params[:id])
  end


  def create
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
    @city = City.find_by_id(params[:id])
    render :edit
  end


  def update
    @city = City.find_by_id(params[:id])
    if @city.update(city_params)
      flash[:success] = "Successfully updated city."
      redirect_to @city
    else
      flash[:error] = @city.errors.full_messages.join(", ")
      redirect_to edit_city_path(@city)
    end
  end




  private

  def city_params
    params.require(:city).permit(:name, :photo)
  end

end
