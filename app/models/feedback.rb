class Feedback < ActiveRecord::Base

  belongs_to :user

  validates :subject, presence: true
  validates :body, presence: true
  validate :email_check

  def email_check
    sender_email_check = self.sender_email =~ /@/
    if self.sender_email !="" && sender_email_check == nil
      errors.add(:sender_email, "address must be like this example: person@email.com")
      return false
    end
  end

end