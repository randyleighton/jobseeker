class Contact < ActiveRecord::Base

belongs_to :company

validates_uniqueness_of :email
validates_presence_of :first_name, :last_name

end