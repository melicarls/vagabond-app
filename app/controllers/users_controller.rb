class UsersController < ApplicationController

def index
  @users = User.all
  render :index
end




def new
  @user = User.new
  render :new
end




end
