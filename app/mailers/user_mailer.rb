class UserMailer < ActionMailer::Base
  default from: 'http://localhost:3000'
  def registration_confirmation(user)
    @user = user
    @url = "http://localhost:3000/log_in"
    mail(to: @user.email, subject: "Welcome to my app")
  end

end
