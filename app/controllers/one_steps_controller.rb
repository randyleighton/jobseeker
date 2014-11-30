class OneStepsController < ApplicationController
	before_filter :authenticate_user!

  def index
  end

  def new
    @company = Company.new
    @contact = @company.contacts.new
    @job = @company.jobs.new
  end

end