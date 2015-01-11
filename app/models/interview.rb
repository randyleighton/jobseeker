class Interview < ActiveRecord::Base

  belongs_to :job
  has_one :company, through: :job
  has_and_belongs_to_many :contacts

  validates :interview_date, presence: true
  validates :interview_time, presence: true
  validate :verify_date

  scope :order_by, ->{ order(interview_date: :desc)}
  scope :recent, ->(max){ limit(max) }

  def verify_date
    if self.interview_date != nil && self.interview_date < self.job.application_date
      errors.add(:interview_date, "must be after job application date")
      return false
    end
  end

end