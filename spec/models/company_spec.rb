describe Company do

  it { should have_many :contacts }
  it { should have_many :jobs }
  it { should accept_nested_attributes_for :contacts }
  it { should belong_to :user }
  it { should have_many(:interviews).through(:jobs)}
  # it { should belong_to :one_step }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

end