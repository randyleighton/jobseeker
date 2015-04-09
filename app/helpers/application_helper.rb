module ApplicationHelper

  def datadump(current_user)
    companies = Company.where(user_id: current_user.id)
    contacts = Contact.where(user_id: current_user.id)
    jobs = Job.where(user_id: current_user.id)
    interviews = Interview.where(user_id: current_user.id)
    responses = Response.where(user_id: current_user.id)
    followups = Followup.where(user_id: current_user.id)
    feedbacks = Feedback.where(user_id: current_user.id)

    

  end

end
