class HomeController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  
def index
  if current_user
    @companies = Company.where(user_id:current_user.id).by_name
    @interviews = Interview.where(user_id:current_user.id).order_by
    @jobs = Job.where(user_id:current_user.id).order_by
  else
    @companies = []
    @interviews = []
    @jobs = []
  end

end

end