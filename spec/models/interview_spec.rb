describe Interview do

  it { should belong_to :job } 
  it { should validate_presence_of :interview_date }
  it { should have_one(:company).through(:job)}

end