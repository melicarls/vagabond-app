class CitiesController < ApplicationController

  def index
    if !active?
      flash[:notification] = "Please reactivate your account to continue"
      redirect_to edit_user_path(@current_user)
    else
      @cities = City.all
      render :index
    end
  end

  def new
    if !active?
      flash[:notification] = "Please reactivate your account to continue"
      redirect_to edit_user_path(@current_user)
    else
      @city = City.new
      render :new
    end
  end

  def show
    if !active?
      flash[:notification] = "Please reactivate your account to continue"
      redirect_to edit_user_path(@current_user)
    else
      @city = City.find_by_id(params[:id])
    end
  end


  def create
    if !active?
      flash[:notification] = "Please reactivate your account to continue"
      redirect_to edit_user_path(@current_user)
    else
      @city = City.new(city_params)
      if @city.save
        flash[:success] = "Created new city."
        redirect_to @city
      else
        flash[:error] = @city.errors.full_messages.join(", ")
        redirect_to new_city_path
      end
    end
  end



# Restrict to Admin account
  def edit
    if !active?
      flash[:notification] = "Please reactivate your account to continue"
      redirect_to edit_user_path(@current_user)
    else
      @city = City.find_by_id(params[:id])
      render :edit
    end
  end


  def update
    if !active?
      flash[:notification] = "Please reactivate your account to continue"
      redirect_to edit_user_path(@current_user)
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




  private

  def city_params
    params.require(:city).permit(:name, :photo)
  end

end
