class Company < ActiveRecord::Base
before_save :style_text

has_many :contacts, -> { order(last_name: :desc) }, dependent: :destroy
has_many :jobs, -> { order(created_at: :desc) }, dependent: :destroy
has_many :interviews, -> { order(created_at: :desc) }, through: :jobs
has_many :responses, through: :jobs
belongs_to :user
belongs_to :one_step, inverse_of: :company

accepts_nested_attributes_for :contacts
accepts_nested_attributes_for :jobs

validates :name, presence: true

private

def style_text
  self.name = self.name.downcase.titleize
  self.url = self.url.downcase
end


end