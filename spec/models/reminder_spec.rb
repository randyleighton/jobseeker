describe Reminder do

it { should belong_to :rem}
it { should validate_presence_of :subject }
it { should validate_presence_of :due_date }


end