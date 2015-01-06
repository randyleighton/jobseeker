# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class AdminMailerPreview < ActionMailer::Preview

  def send_feedback
    feedback = Feedback.first
    AdminMailer.send_feedback(feedback).deliver_now
  end


end


