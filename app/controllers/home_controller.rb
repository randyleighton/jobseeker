class HomeController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  
def index
  @companies = Company.all
  @contacts = Contact.all
  @interviews = Interview.all
  @jobs = Job.all
end

end