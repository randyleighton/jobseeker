class Response < ActiveRecord::Base

belongs_to :job
has_one :company, through: :job

end