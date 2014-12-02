class One_step < ActiveRecord::Base

  has_many :companies, inverse_of: :one_step
  has_many :contacts, through: :companies
  has_many :jobs, through: :companies

  accepts_nested_attributes_for :companies

end