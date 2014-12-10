describe Response do

  it { should belong_to :job }
  it { should have_one(:company).through(:job) }
  it { should validate_presence_of :response_date }

  it "should have a contact id" do
    contact = FactoryGirl.create(:contact)
    response = FactoryGirl.create(:response, contact_id: contact.id)
    expect(Response.all).to eq [response]
  end

end