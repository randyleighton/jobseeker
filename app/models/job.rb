class Job < ActiveRecord::Base

belongs_to :company
has_many :interviews

validates_presence_of :description, :location

end