class OneStepsController < ApplicationController
	before_filter :authenticate_user!

  def index
  end

  def new
    @one_step = One_step.new
    @company = Company.new
    @contact = @company.contacts.new
    @job = @company.jobs.new
  end

  def create
    @one_step = One_step.create(onestep_params)
    if @one_step.valid?
      redirect_to root_path
    else
      render 'form', notice: 'Try again'
    end
  end

private
  def onestep_params
    params.require(:one_step).permit(company_attributes: [:name, :url, :comments], job_attributes: [:description, :location,:posting_url,:application_date])
  end

end