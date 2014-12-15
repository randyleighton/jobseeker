describe Interview do

  it { should belong_to :job } 
  it { should validate_presence_of :interview_date }
  it { should have_one(:company).through(:job)}

  it "should have a contact id" do
    contact = FactoryGirl.create(:contact)
    interview = FactoryGirl.create(:interview, contact_id: contact.id)
    expect(Interview.all).to eq [interview]
  end

  it "should be unique to a user" do
    user = FactoryGirl.create(:user)
    interview = FactoryGirl.create(:interview, user_id: user.id)
    expect(interview.user_id).to eq user.id
  end
  it "can add a time to an interview" do
    interview = FactoryGirl.create(:interview, interview_time: "00:38:07 -0800")
  end
end