class Job < ActiveRecord::Base

belongs_to :company
has_many :interviews, dependent: :destroy
has_many :responses, dependent: :destroy
has_one :user, through: :company

validates_presence_of :description, :location
validates :description, uniqueness: true

end