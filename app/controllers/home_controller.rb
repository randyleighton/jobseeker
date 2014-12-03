class HomeController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  
def index
  @companies = Company.where(user_id:current_user.id)
  @contacts = Contact.where(user_id:current_user.id)
  @interviews = Interview.where(user_id:current_user.id)
  @jobs = Job.where(user_id:current_user.id)
end

end