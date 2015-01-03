class FollowupsController < ApplicationController

def index
  @followups = Followup.all.where(id:current_user.id)
end

end