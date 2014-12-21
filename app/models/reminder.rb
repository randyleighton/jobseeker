class Reminder < ActiveRecord::Base

  belongs_to :rem, polymorphic: true

end
