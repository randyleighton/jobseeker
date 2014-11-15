class Contact < ActiveRecord::Base

belongs_to :company
has_many :job_applications

validates_uniqueness_of :email
validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,4})$/i
validates_presence_of :first_name, :last_name

end