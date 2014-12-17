class Reminder < ActiveRecord::Base
  attr_accessible :subject, :body
  belongs_to :rem, polymorphic: true
end
