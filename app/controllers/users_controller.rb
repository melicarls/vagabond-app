class UsersController < ApplicationController

def index
  @users = User.all
  render :index
end




def new
  @user = User.new
  render :new
end




def create
  @user = User.new(user_params)
  if @user.save
    flash[:success] = "Your account has been created."
    redirect_to root_path
  else
    flash[:error] = @user.errors.full_messages.join(", ")
    redirect_to new_user_path
  end
end







private



def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city, :username)
end


end
