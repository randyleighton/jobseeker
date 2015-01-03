class Company < ActiveRecord::Base

has_many :contacts, ->{ order("last_name ASC")}, dependent: :destroy
has_many :jobs, ->{ order("application_date DESC")}, dependent: :destroy
has_many :interviews, through: :jobs
has_many :responses, through: :jobs
belongs_to :user
belongs_to :one_step, inverse_of: :company
has_many :reminders, as: :rem
has_many :followups, as: :follow

accepts_nested_attributes_for :contacts
accepts_nested_attributes_for :jobs

validates :name, presence: true

scope :by_name, ->{ order(:name) }
scope :recent, ->(max){ limit(max) }

before_save :style_text
before_save :external_link
before_save :values_check

private

  def values_check
    self.url = "None yet" if self.url = ""
    self.email = "None yet" if self.email = ""
    self.phone = "None yet" if self.phone = ""
    self.street = "None yet" if self.street = ""
  end

  def style_text
    self.name = self.name.downcase.titleize
    self.url = self.url.downcase if self.url
  end

  def external_link
    if !self.url.include?("http://")
      self.url.insert(0,"http://")
    end
  end

end