class AdminMailer < ActionMailer::Base

  default from: "\"The Jobseeker\" <#{ENV['mailgun_sandbox_username']}>"

  def send_feedback(feedback)
    @feedback = feedback
    @user = User.find(@feedback.user_id)
    @email = @user.email
    @subject = @feedback.subject
    @body = @feedback.body
    mail(to: ENV['visible_difference_admin'], subject: 'Jobseeker User Fedback')
  end

  def feedback_confirmation(feedback)
    @feedback = feedback
    @user = User.find(@feedback.user_id)
    @email = @user.email
    mail(to: @email, subject: "Your feedback to The Jobseeker")
  end

end
