class ResponsesController < ApplicationController
  before_filter :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @all_responses = Response.all
  end

  def new
    @response = Response.new
    @job = Job.find(params[:job_id])
  end

  def create
    @job = Job.find(params[:job_id])
    @response = Response.create(response_params)
    if @response.valid?
      redirect_to root_path, notice: "Response on #{@response.response_date} created."
    else
      render 'new', alert: "Response could not be created."
    end
  end

  def show

  end

  def edit
    render 'new'
  end

  def update
    if @response.update_attributes(response_params)
      redirect_to root_path, notice: "Response updated."
    else
      render response_path(@response), alert: "Failed to Update."
    end
  end

  def destroy
    @response.destroy
    flash[:notice]="Response deleted"
    redirect_to interviews_path
  end

  private

  def response_params
    params.require(:response).permit(:response_date, :notes, :job_id)
  end

  def not_found
      session[:return_to]||= root_url
      redirect_to session[:return_to], flash: {alert: 'Problem finding record, you might not be authorized.'}
  end

end