describe Account do

it "creates an account" do
  account1 = Account.create(account_type:"Linkedin", account_info:"http://www.linkedin.com/in/george")
  expect(Account.all).to eq [account1]
end

end