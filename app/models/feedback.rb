class Feedback < ActiveRecord::Base

belongs_to :user

validates :subject, presence: true


end