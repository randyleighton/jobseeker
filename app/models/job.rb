class Job < ActiveRecord::Base
  before_save :text_style
  
  belongs_to :company
  has_many :interviews, dependent: :destroy
  has_many :responses, -> { order('response_date desc') }, dependent: :destroy
  has_one :user, through: :company

  validates :description, presence: true
  validates :location, presence: true
  validates :application_date, presence: true
  validate :verify_date

  scope :order_by, ->{ order(created_at: :desc)}

  def verify_date
    if self.application_date > DateTime.now
      errors.add(:application_date, "cannot be a future event")
      return false
    end
  end

private

  def text_style
    self.description = self.description.downcase.titleize
    self.location = self.location.downcase.titleize 
    self.posting_url = self.posting_url.downcase  if self.posting_url
    self.status = self.status.downcase.capitalize if self.status
  end

end