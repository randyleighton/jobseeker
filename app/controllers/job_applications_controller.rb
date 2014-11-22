class JobApplicationsController < ApplicationController
	before_filter :authenticate_user!
end