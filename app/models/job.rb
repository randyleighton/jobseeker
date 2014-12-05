class Job < ActiveRecord::Base
before_save :text_style

belongs_to :company
has_many :interviews, dependent: :destroy
has_many :responses, dependent: :destroy
has_one :user, through: :company

validates_presence_of :description, :location
validates :description, uniqueness: true


private

def text_style
  self.description = self.description.downcase.titleize
  self.location = self.location.downcase.titleize
  self.posting_url = self.posting_url.downcase
  self.status = self.status.downcase.capitalize
end

end