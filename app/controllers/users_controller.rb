class UsersController < ApplicationController


def new
  @user = User.new
  render :new
end


def create
  @user = User.new(user_params)
  @user[:active] = true
  @user[:profile_picture] = "https://community.saltmoney.org/6.0.5.f76dfc4/images/jive-profile-default-portrait.png"
  if @user.save
    flash[:success] = "Your account has been created."
    UserMailer.welcome_email(@user).deliver
    login(@user)
    redirect_to @user
  else
    flash[:error] = @user.errors.full_messages.join(", ")
    redirect_to new_user_path
  end
end


def show
  @user = User.find_by_id(params[:id])
  render :show

end



def edit
  @user = User.find_by_id(params[:id])
  if session[:user_id] != @user[:id]
    flash[:alert] = "You may not edit another user's profile."
    render :show
  else
    render :edit
  end
end


# Once sessions are complete, verify current_user
def update
  @user = User.find_by_id(params[:id])
  if session[:user_id] == @user[:id]
    @user.update(user_params)
    flash[:notice] = "Successfully updated profile."
    redirect_to user_path(@user)
  else
    flash[:error] = @user.errors.full_messages.join(", ")
    redirect_to edit_user_path(@user)
  end
end

def toggle
  @user = User.find_by_id(params[:id])
  if @user.update({ active: !@user[:active] })
    if @user[:active]
      flash[:success] = "Welcome back! Your account has been reactivated. "
      redirect_to user_path(@user)
    else !@user[:active]
      flash[:alert] = "Your account has been deactivated and you have been logged out."
      logout
      redirect_to cities_path
    end
  else
    flash[:error] = @user.errors.full_messages.join(", ")
    redirect_to edit_user_path(@user)
  end
end



private



def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city, :username, :active)
end


end
