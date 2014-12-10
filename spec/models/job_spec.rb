describe Job do

  it { should belong_to :company } 
  it { should have_many :interviews }
  it { should have_many :responses }
  it { should have_one(:user).through(:company)}

  describe "text styling" do
    it "should titleize all the words in the description" do
      job = FactoryGirl.create(:job)
      expect(job.description).to eq "Ruby Rails Developer"
    end
    it "should downcase and titleize the location" do
      job = FactoryGirl.create(:job)
      expect(job.location).to eq "Portland, Or"
    end
    it "should downcase the posting_url" do
      job = FactoryGirl.create(:job)
      expect(job.posting_url).to eq "www.code.com"
    end
  end

  describe "date criteria" do
    it "should display jobs from most recent to oldest applied for" do
      job1 = Job.create({description: "Rails Dev", application_date: "12/7/2014", 
                         location: "Bend, OR", posting_url: "www.abc.com"})
      job2 = Job.create({description: "Rails Ruby Dev", application_date: "12/5/2014", 
                         location: "Portland, OR", posting_url: "www.abc.com"})
      expect(Job.order_by).to eq [job2, job1]
    end

    it "should allow job applications to be created now or prior" do
      date_now = Date.new(2014,12,6)
      date_prev = Date.new(2014,12,1)
      date_future = Date.new(2014,12,10)
      job = FactoryGirl.create(:job, application_date: date_prev)
      job2 = FactoryGirl.create(:job, application_date: date_now)
      expect(job.application_date).to be <= date_now
      expect(job2.application_date).to be <= date_now
    end

    it "should not allow job applications to be created in the future" do
      date_now = Date.new(2014,12,6)
      date_future = date_now + 20
      job = FactoryGirl.build(:job, application_date: date_future)
      expect(job.save).to eq false
    end
  end

  it "should have an open or closed status" do
    job = FactoryGirl.create(:job, status:"closed")
    expect(Job.all).to eq [job]
  end
  it "should be unique to a user" do
    user = FactoryGirl.create(:user)
    job = FactoryGirl.create(:job, user_id: user.id)
    expect(job.user_id).to eq user.id
  end

end


