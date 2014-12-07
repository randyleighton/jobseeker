class Interview < ActiveRecord::Base

  belongs_to :job
  has_one :company, through: :job

  validates :interview_date, presence: true

  # def verify_date(job)
  #   if self.interview_date.strftime("%m/%d/%Y") < job.application_date.strftime("%m/%d/%Y")
  #     errors.add(:interview_date, "can not be before job application date")
  #     return false
  #   end
  # end

end