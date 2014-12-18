class HomeController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  
def index
  if current_user
    @companies = Company.where(user_id:current_user.id).by_name
    @contacts = Contact.where(user_id:current_user.id)
    @interviews = Interview.where(user_id:current_user.id)
    @jobs = Job.where(user_id:current_user.id)
  else
    @companies = []
    @contacts = []
    @interviews = []
    @jobs = []
  end

end

end