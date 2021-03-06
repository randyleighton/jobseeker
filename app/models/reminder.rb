class Reminder < ActiveRecord::Base

  belongs_to :rem, polymorphic: true
  validates :subject, presence: true
  validates :due_date, presence: true

  scope :recent, ->(max){ limit(max) }

end
