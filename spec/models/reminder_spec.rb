describe Reminder do

it { should belong_to :rem}
it { should validate_presence_of :subject }

end