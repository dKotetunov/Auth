class UserMailer < ActionMailer::Base

  def registration_confirmation(user)
    @user = user
    @url = "example@mail.com"
    mail(to: @user.email,subject: "Welcome to my app")
  end

end
