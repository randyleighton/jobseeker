describe Job do

it { should belong_to :company } 
it { should have_many :interviews }

end