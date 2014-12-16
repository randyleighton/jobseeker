class Interview < ActiveRecord::Base

  belongs_to :job
  has_one :company, through: :job

  validates :interview_date, presence: true
  validates :interview_time, presence: true

  scope :order_by, ->{ order(interview_date: :desc)}

end