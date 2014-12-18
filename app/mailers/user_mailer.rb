class UserMailer < ActionMailer::Base
  default from: 'notifications@example.com'
  def registration_confirmation(user)
    @user = user
    @url = "http://example.com/log_in"
    mail(to: @user.email, subject: "Welcome to my app")
  end

end
