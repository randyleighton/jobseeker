class Company < ActiveRecord::Base

has_many :contacts, dependent: :destroy
has_many :jobs, dependent: :destroy
has_many :interviews, through: :jobs
has_many :responses, through: :jobs
belongs_to :user
belongs_to :one_step, inverse_of: :company

accepts_nested_attributes_for :contacts
accepts_nested_attributes_for :jobs

validates :name, presence: true

end