describe Contact do

  it { should belong_to :company}
  it { should have_many :reminders }
  it { should have_many :followups }

  let!(:user1) { build(:user) }
  let!(:company) { build(:company)}

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

  it "should validate email address has the @ as valid" do
    contact = FactoryGirl.create(:contact, user_id: user1.id, email: "coder@code.com")
    expect(contact).to be_valid       
  end

  it "should validate email address without the @ as invalid" do
    contact = FactoryGirl.create(:contact, user_id: user1.id, email: "coder@code.com")
    contact.email = nil
    expect(contact).to_not be_valid
  end

  it "should display all contacts in lastname order with by_last_name method" do
    contact1 = FactoryGirl.create(:contact, last_name: "Snausager", email: "coder1@code.com")
    contact2 = FactoryGirl.create(:contact, last_name: "Pickleton", email: "coder2@code.com")
    expect(Contact.by_last_name).to eq [contact2, contact1]
  end

end