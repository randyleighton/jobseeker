describe Company do

  it { should have_many :contacts }
  it { should have_many :jobs }
  it { should belong_to :user }
  it { should have_many(:interviews).through(:jobs) }
  it { should have_many(:responses).through(:jobs) }
  # it { should belong_to :one_step }
  it { should validate_presence_of :name }
  it { should accept_nested_attributes_for :contacts }
  it { should have_many :reminders }
  it { should have_many :followups }

let!(:company1) { FactoryGirl.create(:company, name: "Beta", url: "www.beta.com") }
let!(:company2) { FactoryGirl.create(:company, name: "Alpha", url: "www.alpha.com") }
let!(:company3) { FactoryGirl.create(:company, name: "Charlie", url: "www.charlie.com") }


  it "should display the number of companies passed into scope" do
    expect(Company.all).to eq [company1,company2,company3]
    expect(Company.recent(2)).to eq [company1,company2]
  end

  it "should display companies in alphabetical order" do
    expect(Company.by_name).to eq [company2,company1,company3]  
  end
  it "should be unique to a user" do
    user = FactoryGirl.create(:user)
    company = FactoryGirl.create(:company, user_id: user.id)
    expect(company.user_id).to eq user.id
  end
  describe "nested order" do
    it "should display nested contacts by name order" do
      contact1 = FactoryGirl.create(:contact, last_name: "Sanders", company_id: company1.id, email:"yar@yar.com")
      contact2 = FactoryGirl.create(:contact, last_name: "Landers", company_id: company1.id)
      contact3= FactoryGirl.create(:contact, last_name: "Anders", company_id: company1.id, email:"yar2@yar.com")
      expect(company1.contacts).to eq [contact3,contact2, contact1]
    end
    it "should display nested jobs by application date" do
      job1 = FactoryGirl.create(:job, company_id: company1.id, application_date: DateTime.now - 1)
      job2 = FactoryGirl.create(:job, company_id: company1.id, application_date: DateTime.now)
      expect(company1.jobs).to eq [job2, job1]
    end
    it "should display nested followups by action date" do
      followup = FactoryGirl.create(:followup, follow_id: company1.id, action: "Oldest Action", action_date: DateTime.now-1)
      followup2 = FactoryGirl.create(:followup, follow_id: company1.id,action:"Newest Action", action_date: DateTime.now)
      expect(company1.followups).to eq [followup2, followup]
    end

  end

end



