describe Response do

  it { should belong_to :job }
  it { should have_one(:company).through(:job) }
  it { should validate_presence_of :response_date }

end