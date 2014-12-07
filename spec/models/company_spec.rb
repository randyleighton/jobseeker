describe Company do

  it { should have_many :contacts }
  it { should have_many :jobs }
  it { should belong_to :user }
  it { should have_many(:interviews).through(:jobs) }
  it { should have_many(:responses).through(:jobs) }
  # it { should belong_to :one_step }
  it { should validate_presence_of :name }
  it { should accept_nested_attributes_for :contacts }

  it "should display companies in alphabetical order" do
    company1 = Company.create({name:"Beta", url: "www.beta.com"})
    company2 = Company.create({name: "Alpha", url: "www.alpha.com"})
    expect(Company.by_name).to eq [company2,company1]  
  end
  
end