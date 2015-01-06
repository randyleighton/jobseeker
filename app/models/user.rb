class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  after_create :signup_confirm

  has_many :companies
  has_many :jobs, through: :companies
  has_many :interviews, through: :companies
  has_many :feedbacks
  validates :email, uniqueness: true

  def signup_confirm
    UserMailer.signup_confirmation(self).deliver_now
  end
end
