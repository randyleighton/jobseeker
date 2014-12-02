class UserMailer < ActionMailer::Base
  default from: "randyleighton@visible-difference.com"

  def signup_confirmation(user)
    @user = user
    @url = "http://localhost:3000/users/login"
    mail to: "randyleighton@yahoo.com", subject: "Sign up for Jobseeker"
  end

  def send_reminder(user, job)
    @user = user
    @url = "http://localhost:3000/users/login"
    @job = job
    mail to: "#{@user.email}", subject: "#{@job.description} - Reminder"
  end
end
