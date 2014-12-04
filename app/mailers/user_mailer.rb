class UserMailer < ActionMailer::Base

  default from: "\"The Jobseeker\" <#{ENV['mailgun_sandbox_username']}>"

  def signup_confirmation(user)
    @user = user
    @email = @user.email
    mail(to: @email, subject: 'Welcome to My Jobseeker')
  end
  
end
