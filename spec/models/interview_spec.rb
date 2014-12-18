describe Interview do

  it { should belong_to :job } 
  it { should validate_presence_of :interview_date }
  it { should validate_presence_of :interview_time }

  it { should have_one(:company).through(:job)}

 let!(:job) { create(:job, application_date: DateTime.now-1) }
 let!(:user) { create(:user) }
 let!(:contact) { contact = FactoryGirl.create(:contact) }

  it "should have a contact id" do
    interview = FactoryGirl.create(:interview, interview_date: DateTime.now, contact_id: contact.id, job_id:job.id)
    expect(Interview.all).to eq [interview]
  end

  it "should be unique to a user" do
    interview = FactoryGirl.create(:interview, interview_date: DateTime.now, user_id: user.id, job_id:job.id)
    expect(interview.user_id).to eq user.id
  end

  it "can add a time to an interview with Time object" do
    interview = FactoryGirl.create(:interview, interview_date: DateTime.now, interview_time: Time.now, job_id:job.id)
  end

  it "can add a time to an interview with DateTime object" do
    interview = FactoryGirl.create(:interview, interview_date: DateTime.now, interview_time: DateTime.now, job_id:job.id)
  end

  it "displays most recent interviews" do
    interview1 = FactoryGirl.create(:interview, interview_date: DateTime.now-1, interview_time: DateTime.now, job_id:job.id)
    interview2 = FactoryGirl.create(:interview, interview_date: DateTime.now, interview_time: DateTime.now, job_id:job.id)
    expect(Interview.order_by). to eq [interview2,interview1]
  end

end