class JobsController < ApplicationController
	before_filter :authenticate_user!
  before_filter :find_company, except: :index
  before_filter :find_job, except: [:index, :new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @all_jobs = Job.where(user_id:current_user.id).order_by
  end

  def new
    @job = @company.jobs.new
  end

  def create
    @user = current_user
    @job = @company.jobs.create(job_params)
    if @job.valid?
      redirect_to company_path(@company), notice: "#{@job.description} with #{@job.company.name} created."
    else
      render 'new', alert: "Job posting could not be created."
    end
  end

  def show
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to company_job_path, notice: "#{@job.description} job application updated."
    else
      render company_job_path(@job), alert: "Failed to Update."
    end
  end

  def destroy
    @job.destroy
    flash[:notice]="#{@job.description} job application, interviews, and responses deleted."
    redirect_to company_path(@company)
  end

  private

  def job_params
    params.require(:job).permit(:description, :location, :posting_url,:application_date, :company_id, :status, :user_id)
  end

  def find_company
    @company = Company.find(params[:company_id])
  end

  def find_job
    @job = @company.jobs.find(params[:id])
  end

  def not_found
      session[:return_to]||= root_url
      redirect_to session[:return_to], flash: {alert: 'Problem finding record, you might not be authorized.'}
  end


end