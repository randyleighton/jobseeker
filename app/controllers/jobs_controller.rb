class JobsController < ApplicationController
	before_filter :authenticate_user!
  before_filter :find_company, except: :index
  before_filter :find_job, except: [:index, :new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @all_jobs = Job.all
  end

  def new
    @job = @company.jobs.new
  end

  def create
    @job = @company.jobs.create(job_params)
    if @job.valid?
      redirect_to company_jobs_path, notice: "#{@job.description} with #{@job.company.name} created."
    else
      render 'new', alert: "Job posting could not be created."
    end
  end

  def show
  end

  def edit
  end

  def update
    if @job.update_attributes(job_params)
      redirect_to company, notice: "#{@job.description} updated."
    else
      render job_path(@job), alert: "Failed to Update."
    end
  end

  def destroy
    @job.destroy, notice: "Job deleted"
    redirect_to company_path
  end

  private

  def job_params
    params.require(:job).permit(:description, :location, :posting_number, :company_id)
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