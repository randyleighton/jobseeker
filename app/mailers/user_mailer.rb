class UserMailer < ActionMailer::Base
  default from: "randyleighton@visible-difference.com"

  def signup_confirmation(user)
    @user = user
    @greeting = "Hello"
    mail to: "randyleighton@yahoo.com", subject: "Sign up for Jobseeker"
  end

  def send_reminder(user, job)
    @user = user
    @greeting = "Hello"
    @job = job
    mail to: "#{@user.email}", subject: "#{@job.description} - Reminder"
  end
end
