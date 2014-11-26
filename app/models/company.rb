class Company < ActiveRecord::Base

has_many :contacts, dependent: :destroy
has_many :jobs, dependent: :destroy

validates :name, presence: true, uniqueness: true

end