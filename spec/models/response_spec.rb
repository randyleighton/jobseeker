describe Response do

  it { should belong_to :job }
  it { should have_one(:company).through(:job) }
  it { should validate_presence_of :response_date }

  it "should have a contact id" do
    contact = FactoryGirl.create(:contact)
    response = FactoryGirl.create(:response, contact_id: contact.id)
    expect(Response.all).to eq [response]
  end

  it "should be unique to a user" do
    user = FactoryGirl.create(:user)
    response = FactoryGirl.create(:response, user_id: user.id)
    expect(response.user_id).to eq user.id
  end

end