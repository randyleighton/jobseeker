class UserMailer < ActionMailer::Base
  default from: "randyleighton@visible-difference.com"

  def signup_confirmation(user)
    @user = user
    @greeting = "Hello"
    mail to: "randyleighton@yahoo.com", subject: "Sign up for Jobseeker"
  end

end
