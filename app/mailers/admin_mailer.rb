class AdminMailer < ActionMailer::Base

  default from: "\"The Jobseeker\" <#{ENV['mailgun_sandbox_username']}>"

  def send_feedback(feedback)
    @feedback = feedback
    @user = @feedback.sender_name
    @email = @feedback.sender_email
    @subject = @feedback.subject
    @body = @feedback.body
    mail(to: ENV['visible_difference_admin'], subject: 'Jobseeker User Feedback')
  end

  def feedback_confirmation(feedback)
    @feedback = feedback
    mail(to: @feedback.sender_email, subject: "Your feedback to The Jobseeker")
  end

end
