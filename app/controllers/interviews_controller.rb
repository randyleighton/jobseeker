class InterviewsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_interview, except: [:index,:new, :create]
  before_filter :find_job, except: [:index]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @all_interviews = Interview.where(user_id:current_user.id)
  end

  def new
    @interview = Interview.new
  end

  def create
    @company = Company.find(@job.company_id)
    @interview = Interview.create(interview_params)
    if @interview.valid?
      redirect_to company_job_path(@company, @job), notice: "Interview on #{@interview.interview_date.strftime("%m/%d/%Y")} created."
    else
      render 'new', alert: "Interview could not be created."
    end
  end

  def show
    @company = Company.find(@job.company_id)
  end

  def update
    if @interview.update_attributes(interview_params)
      redirect_to job_interview_path, notice: "Interview on #{@interview.interview_date.strftime("%m/%d/%Y")} updated."
    else
      render job_interview_path(@interview), alert: "Failed to Update."
    end
  end

  def destroy
    @interview.destroy
    flash[:notice]="Interview on #{@interview.interview_date.strftime("%m/%d/%Y")} deleted"
    @company = Company.find(@job.company_id)
    redirect_to company_job_path(@company, @job)
  end

  private

  def find_interview
    @interview = Interview.find(params[:id])
  end

  def find_job
    @job = Job.find(params[:job_id])
  end

  def interview_params
    params.require(:interview).permit(:interview_date, :notes, :job_id, :user_id)
  end

  def not_found
      session[:return_to]||= root_url
      redirect_to session[:return_to], flash: {alert: 'Problem finding record, you might not be authorized.'}
  end

end