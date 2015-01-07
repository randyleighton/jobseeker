class FeedbacksController < ApplicationController
  
  def new
    @feedback = Feedback.new
  end

  def create
    result = HTTParty.get("https://www.google.com/recaptcha/api/siteverify?secret=" + ENV['recaptcha_secretkey'] + "&response=" + params["g-recaptcha-response"])
    if result["success"] != true
      flash["alert"]="No bots/computers/spam allowed, please verify you are not a robot."
      @feedback = Feedback.new(feedback_params)
      render 'new'
    else
      @feedback = Feedback.create(feedback_params)
      if @feedback.valid?
        AdminMailer.send_feedback(@feedback).deliver_now
        if @feedback.sender_email != ""
          AdminMailer.feedback_confirmation(@feedback).deliver_now
        end
        redirect_to root_path, notice: "Thank you so much for the feedback, we will look at it ASAP"
      else
        render 'new'
      end
    end
  end

private

  def feedback_params
    params.require(:feedback).permit(:subject, :body, :sender_name, :sender_email, :user_id)
  end

end