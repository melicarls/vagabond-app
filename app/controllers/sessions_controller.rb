class SessionsController < ApplicationController


  def new
    @user = User.new
    render 'new'
  end



  def create
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:success] = "Successfully logged in!"
      redirect_to @user
    else
      flash[:error] = "Incorrect username or password. Please try again."
      redirect_to new_session_path
    end
  end





  private



  def user_params
    params.require(:user).permit(:password, :username)
  end



end
