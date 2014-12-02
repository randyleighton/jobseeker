class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  after_create :signup_confirmation

  has_many :companies

  def signup_confirmation
    UserMailer.signup_confirmation(self).deliver
  end
end
