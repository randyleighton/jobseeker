class JobsController < ApplicationController
	before_filter :authenticate_user!

  before_filter :find_company, except: :index
  before_filter :find_job, except: :index
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    # @contacts = @company.contacts
    @all_jobs = Job.all
  end

  def new
    @job = @company.jobs.new
  end

  def create
    @job = @company.jobs.create(job_params)
    if @job.valid?
      redirect_to company_jobs_path, notice: "#{@job.description} with #{@job.company_id.name} created."
    else
      render 'new', alert: "Job posting could not be created."
    end
  end

  def show

  end

  def update
    if @job.update_attributes(job_params).valid?
      redirect_to :back, notice: "#{@job.description} updated."
    else
      render job_path(@job), alert: "Failed to Update."
    end
  end

  def destroy
    @job.destroy
    flash[:notice]="Job deleted"
    redirect_to(:action=>'index')
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