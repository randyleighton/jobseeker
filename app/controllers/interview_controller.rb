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

  def show

  end

  def edit
    render 'new'
  end

  def update
    if @interview.update_attributes(interview_params)
      redirect_to interviews_path, notice: "#Interview updated."
    else
      render interview_path(@interview), alert: "Failed to Update."
    end
  end

  def destroy
    @interview.destroy
    flash[:notice]="Interview deleted"
    redirect_to interviews_path
  end

  private

  def interview_params
    params.require(:interview).permit(:interview_date, :notes, :interview_id)
  end

  def not_found
      session[:return_to]||= root_url
      redirect_to session[:return_to], flash: {alert: 'Problem finding record, you might not be authorized.'}
  end

end