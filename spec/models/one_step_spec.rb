describe One_step do

  it { should have_many :companies }
  it { should have_many(:contacts).through(:companies) }
  it { should have_many(:jobs).through(:companies) }
  it { should accept_nested_attributes_for :companies }

end