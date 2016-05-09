class UserMailer < ApplicationMailer

  default from: "vagabondgroup2@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email , subject: 'Welcome to Vagabond')
  end

end
