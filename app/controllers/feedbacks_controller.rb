class FeedbacksController < ApplicationController
  # before_filter :authenticate_user!

  def new
      @feedback = Feedback.new
      if current_user
        @user = current_user
      else
        @user = User.new
  end

  def create
    @feedback = Feedback.create(feedback_params)
    if @feedback.valid?
      AdminMailer.send_feedback(@feedback).deliver_now
      AdminMailer.feedback_confirmation(@feedback).deliver
      redirect_to root_path, notice: "Thank you so much for the feedback, we will look at it ASAP"
    else
      render 'new'
    end

  end

private

  def feedback_params
    params.require(:feedback).permit(:user_id, :subject, :body)
  end

end