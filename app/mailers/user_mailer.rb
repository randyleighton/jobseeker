class UserMailer < ActionMailer::Base

  def signup_confirmation(user)
    @user = user
    @email = @user.email
    @from = ENV['mailgun_sandbox_username']
    binding.pry
    mail(to: @email, from: @from,subject: 'Welcome to My Jobseeker')
  end
  
end
