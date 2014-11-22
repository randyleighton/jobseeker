class InterviewsController < ApplicationController
  before_filter :authenticate_user!

def index
    @all_interviews = Interview.all
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = @interview.create(interview_params)
    if @interview.valid?
      redirect_to interviews_path, notice: "Interview on #{@interview.date} created."
    else
      render 'new', alert: "Interview could not be created."
    end
  end


end


end