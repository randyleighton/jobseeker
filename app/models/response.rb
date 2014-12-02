class Response < ActiveRecord::Base

belongs_to :job
has_one :company, through: :job

validates :response_date, presence: true

end