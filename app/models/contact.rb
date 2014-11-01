class Contact < ActiveRecord::Base

belongs_to :company
has_many :job_applications

end