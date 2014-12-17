class Reminder < ActiveRecord::Base
  attr_accessor :subject, :body
  belongs_to :rem, polymorphic: true
end
