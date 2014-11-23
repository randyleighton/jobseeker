class Job < ActiveRecord::Base

belongs_to :company
has_many :interviews
has_one :response

validates_presence_of :description, :location

end