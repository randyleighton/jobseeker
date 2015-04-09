module ApplicationHelper

  def datadump(current_user)
    companies = Company.where(user_id: current_user.id)
  end

end
