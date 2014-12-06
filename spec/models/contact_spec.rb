describe Contact do

  it { should belong_to :company}

  let!(:user1) { build(:user) }
  let!(:user2) { build(:user) }

  it 'instantiates a user' do
    expect(user1.class.name).to eq("User")
  end

  it "should display contacts in alphabetical order by last name" do
    expect(User.all).to eq [user2, user1]
  end

end