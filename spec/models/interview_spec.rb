describe Interview do

  it { should belong_to :job } 
  it { should validate_presence_of :interview_date }
  it { should have_one(:company).through(:job)}

  it "should have a contact id" do
    contact = FactoryGirl.create(:contact)
    interview = FactoryGirl.create(:interview, contact_id: contact.id)
    expect(Interview.all).to eq [interview]
  end

end