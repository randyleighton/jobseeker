describe Reminder do

it { should belong_to :rem}
it { should validate_presence_of :subject }
it { should validate_presence_of :due_date }

let!(:company) { FactoryGirl.create(:company, name:"Beta", url: "www.beta.com") }

describe "scope testing" do
  it "should display the number of reminders passed into scope" do
    reminder = Reminder.create(subject:"Reminder", due_date:"2014/12/31")
    reminder2 = Reminder.create(subject:"Reminder 2", due_date:"2015/1/1")
    expect(Reminder.all).to eq [reminder,reminder2]
    expect(Reminder.recent(1)).to eq [reminder]
  end
end

end