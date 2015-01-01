class FeedbacksController < ApplicationController
  before_filter :authenticate_user!

  def new
    @feedback = Feedback.new
    @user = current_user
  end

  def create
    @feedback = Feedback.create(feedback_params)
    if @feedback.valid?
      redirect_to root_path, notice: "Thank you so much for the feedback, we will look at it"
    else
      render 'new'
    end

  end

private

  def feedback_params
    params.require(:feedback).permit(:user_id, :subject, :body)
  end

end