class UserMailer < ApplicationMailer

  default from "vagabondgroup2@gmail.com"

  def welcome_email(user)
    @user = user
    @url = "https://glacial-ridge-30784.herokuapp.com/"
    mail(to: @user.email, subject: 'Welcome to Vagabond')
  end

end
