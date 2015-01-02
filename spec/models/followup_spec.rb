describe Followup do

it { should belong_to :follow }
it { should validate_presence_of :action }


end