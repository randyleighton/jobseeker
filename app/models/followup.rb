class Followup < ActiveRecord::Base

  belongs_to :follow, polymorphic: true
  validates :action, presence: true

  scope :recent, ->(max){ limit(max) }
  scope :order_by, ->{ order(action_date: :desc)}

end