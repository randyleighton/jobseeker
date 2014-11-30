class OneStepsController < ApplicationController
	before_filter :authenticate_user!

  def index
  end

  def new
    @company = Company.new
    @contact = @company.contacts.new
    @job = @company.jobs.new
  end

  def create
    if @company.create(params[:company])
      redirect_to company_path(@company)
    else
      render 'form', notice: 'Try again'
    end
  end

end