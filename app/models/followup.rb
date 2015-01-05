class Followup < ActiveRecord::Base

  belongs_to :follow, polymorphic: true
  validates :action, presence: true
  validate :check_date

  scope :recent, ->(max){ limit(max) }
  scope :order_by, ->{ order(action_date: :desc)}


  def check_date
    if self.action_date !=nil && self.action_date > DateTime.now
      errors.add(:action_date, "can not be in the future")
      return false
    end
  end

end