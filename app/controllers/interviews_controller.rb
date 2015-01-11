class InterviewsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_interview, except: [:index,:new, :create]
  before_filter :find_job, except: [:index]
  before_filter :find_company, except: [:index]
  # rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @all_interviews = Interview.where(user_id:current_user.id).order_by
  end

  def new
    @interview = Interview.new
    @contacts = Contact.all.where(user_id: current_user.id).where(company_id: @company.id)

  end

  def create
    @contacts = Contact.all.where(user_id: current_user.id).where(company_id: @company.id)
    @interview = Interview.create(interview_params)
    if @interview.valid?
      redirect_to company_job_path(@company, @job), notice: "Interview on #{@interview.interview_date.strftime("%m/%d/%Y")} created."
    else
      @interview.interview_date = nil
      @interview.interview_time = nil
      render 'new', alert: "Interview could not be created."
    end
  end

  def show
  end

  def edit
    @contacts = @interview.contacts
  end

  def update
    @contacts = Contact.all.where(user_id: current_user.id).where(company_id: @company.id)
    @interview.update_attributes(interview_params)
    if @interview.valid?
      redirect_to company_job_path(@company,@job), notice: "Interview on #{@interview.interview_date.strftime("%m/%d/%Y")} updated."
    else
      render job_interview_path(@interview), alert: "Failed to Update."
    end
  end

  def destroy
    @interview.destroy
    flash[:notice]="Interview on #{@interview.interview_date.strftime("%m/%d/%Y")} deleted"
    redirect_to company_job_path(@company, @job)
  end

  private

  def find_interview
    @interview = Interview.find(params[:id])
  end

  def find_job
    @job = Job.find(params[:job_id])
  end

  def find_company
    @company = Company.find(@job.company_id)
  end

  def interview_params
    params.require(:interview).permit(:interview_date, :interview_time, :notes, :job_id, :user_id, contact_ids: [])
  end

  def not_found
      session[:return_to]||= root_url
      redirect_to session[:return_to], flash: {alert: 'Problem finding a record, you might not be authorized.'}
  end

end