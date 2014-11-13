class Company < ActiveRecord::Base

has_many :contacts
has_many :jobs

validates :name, presence: true, uniqueness: true

end