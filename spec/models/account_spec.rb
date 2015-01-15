describe Account do

let(:account1) { FactoryGirl.create(:account) }

  it "creates an account" do
    account1 = Account.create(account_type:"Linkedin", account_info:"http://www.linkedin.com/in/george")
    expect(Account.all).to eq [account1]
  end

  it "creates an account with FactoryGirl" do
    account = FactoryGirl.create(:account, account_type: "Twitter", account_info: "@george")
    expect(account.account_info).to eq "@george"
  end

end