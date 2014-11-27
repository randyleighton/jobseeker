class Interview < ActiveRecord::Base

  belongs_to :job

  validates :interview_date, presence: true

end