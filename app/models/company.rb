class Company < ActiveRecord::Base

has_many :contacts, dependent: :destroy
has_many :jobs, dependent: :destroy
belongs_to :one_step

accepts_nested_attributes_for :contacts

validates :name, presence: true, uniqueness: true

end