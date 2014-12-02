describe User do

it { should have_many :companies }
it { should have_many(:jobs).through(:companies) }


end