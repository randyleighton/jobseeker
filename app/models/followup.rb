class Followup < ActiveRecord::Base

  belongs_to :follow, polymorphic: true
  validates :action, presence: true

  scope :recent, ->(max){ limit(max) }

end