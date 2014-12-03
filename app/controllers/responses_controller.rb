class ResponsesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_response, except: [:index,:new, :create]
  before_filter :find_job, except: [:index]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @all_responses = Response.where(user_id:current_user.id)
  end

  def new
    @response = Response.new
  end

  def create
    @company = Company.find(@job.company_id)
    @response = Response.create(response_params)
    if @response.valid?
      redirect_to company_job_path(@company, @job), notice: "Response on #{@response.response_date} created."
    else
      render 'new', alert: "Response could not be created."
    end
  end

  def show
    @company = Company.find(@job.company_id)
  end

  def edit
    render 'new'
  end

  def update
    if @response.update_attributes(response_params)
      redirect_to job_response_path, notice: "Response updated."
    else
      render job_response_path(@response), alert: "Failed to Update."
    end
  end

  def destroy
    @response.destroy
    flash[:notice]="Response deleted"
    @company = Company.find(@job.company_id)
    redirect_to company_job_path(@company, @job)
  end

  private

  def find_response
    @response = Response.find(params[:id])
  end

  def find_job
    @job = Job.find(params[:job_id])
  end

  def response_params
    params.require(:response).permit(:response_date, :notes, :job_id, :user_id)
  end

  def not_found
      session[:return_to]||= root_url
      redirect_to session[:return_to], flash: {alert: 'Problem finding record, you might not be authorized.'}
  end

end