class HomeController < ApplicationController
	before_filter :authenticate_user!, except: [:index]
def index
	@companies = Company.all
	@contacts = Contact.all
	@jobs = Job.all
	# @job_application = Job_application.all
end

end