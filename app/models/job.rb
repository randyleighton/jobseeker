class Job < ActiveRecord::Base

belongs_to :company

validates_presence_of :description, :location


end