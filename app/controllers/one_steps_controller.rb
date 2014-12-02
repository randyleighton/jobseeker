class OneStepsController < ApplicationController
	before_filter :authenticate_user!

  def index
    @one_steps = One_step.all
  end

  def new
    @one_step = One_step.new
    @one_step.companies.build
  end

  def create
    @one_step = One_step.create(onestep_params)
    binding.pry
    if @one_step.valid?
      redirect_to root_path
    else
      render 'form', notice: 'Try again'
    end
  end

private
  def onestep_params
    params.require(:one_step).permit(company: [:name, :url, :comments], job: [:description, :location,:posting_url,:application_date])

  end

end