describe Job do

  it { should belong_to :company } 
  it { should have_many :interviews }
  it { should have_many :responses }
  it { should have_one(:user).through(:company)}

  it "should display jobs from most recent to oldest applied for" do
    job1 = Job.create({description: "Rails Dev", application_date: "12/7/2014", 
                       location: "Bend, OR", posting_url: "www.abc.com"})
    job2 = Job.create({description: "Rails Ruby Dev", application_date: "12/5/2014", 
                       location: "Portland, OR", posting_url: "www.abc.com"})
    expect(Job.order_by).to eq [job2, job1]
  end

  it "should titleize all the words in the description" do
    job = FactoryGirl.create(:job)
    expect(job.description.titleize).to eq "Ruby Rails Developer"
  end
  it "should downcase and titleize the location" do
    job = FactoryGirl.create(:job)
    expect(job.location.titleize).to eq "Portland, Or"
  end


end