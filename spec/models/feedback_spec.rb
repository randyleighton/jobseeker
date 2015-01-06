describe Feedback do

  it { should belong_to :user }
  it { should validate_presence_of :subject }
  it { should validate_presence_of :body }


  let!(:user) { FactoryGirl.create(:user)}
  let!(:feedback)  {feedback = FactoryGirl.create(:feedback) }

  it "creates a feedback for a user" do
    expect(Feedback.all).to eq [feedback]
  end

  it "sends feedback for the logged in user" do
    feedback = FactoryGirl.create(:feedback, user_id: user.id)
  end

  #this one should pass once the model validation is in place
  # it "should validate email address has the @ as valid" do
  #   expect(feedback.update_attributes(sender_email: "coder@code.com")).to eq true
  # end

  it "should not validate email addresses without the @" do
    feedback = FactoryGirl.create(:feedback, sender_email: "coder@code.com")
    feedback.sender_email = nil
    expect(feedback).to_not be_valid
  end

end