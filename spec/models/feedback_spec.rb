describe Feedback do

it { should belong_to :user }


let!(:user) { FactoryGirl.create(:user)}

it "creates a feedback for a user" do
  feedback = FactoryGirl.create(:feedback)
  expect(Feedback.all).to eq [feedback]
end

it "sends feedback for the logged in user" do
  feedback = FactoryGirl.create(:feedback, user_id: user.id)

end
end