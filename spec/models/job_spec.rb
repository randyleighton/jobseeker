describe Job do

  it { should belong_to :company } 
  it { should have_many :interviews }
  it { should have_many :responses }
  it { should have_one(:user).through(:company)}

end