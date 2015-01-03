class Response < ActiveRecord::Base

  belongs_to :job
  has_one :company, through: :job

  validates :response_date, presence: true
  validate :verify_date

  scope :order_by, ->{ order(response_date: :desc)} # for response index

  def verify_date
    if self.response_date !=nil && self.response_date < self.job.application_date
      errors.add(:response_date, "must be after the application date.")
      return false
    end

    if self.response_date !=nil && self.response_date > DateTime.now
      errors.add(:response_date, "can't be in the future.")
      return false
    end

  end

end