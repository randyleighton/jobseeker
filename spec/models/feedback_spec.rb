describe Feedback do

it { should belong_to :user }

it "creates a feedback for a user" do
  feedback = FactoryGirl.create(:feedback)
  expect(Feedback.all).to eq [feedback]
end

end