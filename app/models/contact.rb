class Contact < ActiveRecord::Base
  belongs_to :company
  has_many :reminders, as: :rem
  has_many :followups, as: :follow
  has_and_belongs_to_many :interviews
  has_many :accounts, dependent: :destroy
  accepts_nested_attributes_for :accounts, :reject_if => :all_blank

  validates :email, :format => { :with => /@/, :message => "Invalid email format" }
  validates_presence_of :first_name, :last_name

  before_save :text_style

  scope :by_last_name, -> {order(:last_name) }

  def full_name
    [first_name, last_name].compact.join(' ')
  end

private

  def text_style
    self.first_name = self.first_name.downcase.titleize
    self.last_name = self.last_name.downcase.titleize
    self.title = self.title.titleize
    self.email = self.email.downcase
  end


end