class Reminder < ActiveRecord::Base

  belongs_to :rem, polymorphic: true
  attr_accessor :subject, :body

end
