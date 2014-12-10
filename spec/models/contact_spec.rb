describe Contact do

  it { should belong_to :company}

  let!(:user1) { build(:user) }
  let!(:company) { build(:company)}

  before :each do

  end

  it 'instantiates a user and company' do
    expect(user1.class.name).to eq("User")
    expect(company.class.name).to eq("Company")
  end

  it "should display contacts in alphabetical order by last name" do
    contact1 = FactoryGirl.create(:contact, last_name:"Pizza", email: "1@2.com")
    contact2 = FactoryGirl.create(:contact, last_name: "Cheese", email: "3@4.com")
    expect(Contact.by_last_name).to eq [contact2, contact1]
  end

  it "should be unique to a user" do
    user = FactoryGirl.create(:user)
    contact = FactoryGirl.create(:contact, user_id: user.id)
    expect(contact.user_id).to eq user.id
  end

end