describe Response do

  it { should belong_to :job }
  it { should have_one(:company).through(:job) }
  it { should validate_presence_of :response_date }

let!(:job) { FactoryGirl.create(:job, application_date:DateTime.now-5)}

  it "should have a contact id" do
    contact = FactoryGirl.create(:contact)
    response = FactoryGirl.create(:response, contact_id: contact.id, job_id: job.id, response_date: DateTime.now)
    expect(Response.all).to eq [response]
  end

  it "should be unique to a user" do
    user = FactoryGirl.create(:user)
    response = FactoryGirl.create(:response, user_id: user.id, job_id: job.id, response_date: DateTime.now)
    expect(response.user_id).to eq user.id
  end

  # it "should display responses from newest to oldest" do
  #   response1 = FactoryGirl.create(:response, notes:"Created First")
  #   response2 = FactoryGirl.create(:response, notes:"Created Second")
  #   expect(Response.all).to eq [response2, response1]
  # end

end