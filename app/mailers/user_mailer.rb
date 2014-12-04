class UserMailer < ActionMailer::Base

  default from: "\"The Jobseeker\" <#{ENV['mailgun_sandbox_username']}>"

  def signup_confirmation(user)
    @user = user
    @email = @user.email
    @from = ENV['mailgun_sandbox_username']
    binding.pry
    mail(to: @email, from: @from,subject: 'Welcome to My Jobseeker')
  end
  
end
