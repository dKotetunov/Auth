class UserMailer < ActionMailer::Base

  def registration_confirmation(user)
    recipients  user.email
    from        "app@demo.com"
    subject     "Thank you for registration"
    body         :user => user

  end

end
