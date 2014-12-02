describe Response do

  it { should belong_to :job }
  it { should have_one(:company).through(:job)}

end