class Company < ActiveRecord::Base
before_save :style_text

has_many :contacts, dependent: :destroy
has_many :jobs, dependent: :destroy
has_many :interviews, through: :jobs
has_many :responses, through: :jobs
belongs_to :user
belongs_to :one_step, inverse_of: :company
has_many :reminders, as: :rem

accepts_nested_attributes_for :contacts
accepts_nested_attributes_for :jobs

validates :name, presence: true

scope :by_name, ->{ order(:name) }

private

def style_text
  self.name = self.name.downcase.titleize
  self.url = self.url.downcase if self.url
end


end