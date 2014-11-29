class OneStepsController < ApplicationController
	before_filter :authenticate_user!


  def index
    @one_steps = One_steps.all
  end

  def new
    @company = Company.new
    @contact = @company.contact.new
    @job = @company.job.new
  end

end