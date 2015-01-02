class Followup < ActiveRecord::Base

  belongs_to :follow, polymorphic: true

end