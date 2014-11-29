class OneStep < ActiveRecord::Base

has_many :companies
has_many :contacts, through: :companies
has_many :jobs, through: :companies


end