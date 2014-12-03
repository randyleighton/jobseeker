class UserMailer < ActionMailer::Base
  default from: "randyleighton@yahoo.com"

  def signup_confirmation(user)
    @user = user
    @email = @user.email
    mail(to: @email, subject: 'Welcome to My Jobseeker')
  end
  
end
