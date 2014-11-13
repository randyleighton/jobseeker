class JobsController < ApplicationController
	before_filter :authenticate_user!