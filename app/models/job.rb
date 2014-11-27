class Job < ActiveRecord::Base

belongs_to :company
has_many :interviews, dependent: :destroy
has_one :response, dependent: :destroy

validates_presence_of :description, :location
validates :description, uniqueness: true

end