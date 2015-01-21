class HomeController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  
def index
  if current_user
    @companies = Company.where(user_id:current_user.id).recent(10).latest
    @interviews = Interview.where(user_id:current_user.id).order_by.recent(10)
    @jobs = Job.where(user_id:current_user.id).order_by.recent(10).by_status("Open")
    @reminders = Reminder.where(user_id: current_user.id).recent(10)
  else
    @companies = Company.none
    @interviews = Interview.none
    @jobs = Job.none
    @reminders = Reminder.none
  end

end

end