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
  @user[:active] = true
  @user[:profile_picture] = "https://community.saltmoney.org/6.0.5.f76dfc4/images/jive-profile-default-portrait.png"
  if @user.save
    flash[:success] = "Your account has been created."
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
  render :edit
end

def update

end




private



def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city, :username)
end


end
