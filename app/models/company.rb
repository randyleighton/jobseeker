class Company < ActiveRecord::Base

has_many :contacts, dependent: :destroy
has_many :jobs, dependent: :destroy
belongs_to :one_step, inverse_of: :company

accepts_nested_attributes_for :contacts
accepts_nested_attributes_for :jobs

validates :name, presence: true, uniqueness: true

end