class SessionsController < ApplicationController


  def new
    @user = User.new
    render 'new'
  end



  def create
    @user = User.confirm(user_params)
    if @user
      login(@user)
      if !@user[:active]
        flash[:success] = "You can reactivate your account by clicking the green button."
        redirect_to edit_user_path(@current_user)
      else
        flash[:success] = "Successfully logged in!"
        redirect_to @user
      end
    else
      flash[:error] = "Incorrect username or password. Please try again."
      redirect_to login_path
    end
  end



  def destroy
    logout
    flash[:success] = "Successfully logged out."
    redirect_to root_path
  end




  private



  def user_params
    params.require(:user).permit(:password, :username)
  end



end
