class Reminder < ActiveRecord::Base

  belongs_to :rem, polymorphic: true
  validates :subject, presence: true


end
