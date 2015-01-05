describe Followup do

  it { should belong_to :follow }
  it { should validate_presence_of :action }

let!(:company) { FactoryGirl.create(:company, name:"Beta", url: "www.beta.com") }
let!(:followup) { FactoryGirl.create(:followup, follow_id: company.id, follow_type: "Company", action_date: DateTime.now-1) }

  it "should create a followup" do
    expect(Followup.all).to eq [followup]
  end
  it "should display followups in newest first order on index page" do
    followup2 = FactoryGirl.create(:followup, follow_id: company.id,action:"Newest Action", action_date: DateTime.now)
    expect(Followup.all.order_by).to eq [followup2, followup]
  end

  it "should not create an action already taken in the future" do
    expect(followup.update_attributes(action_date: DateTime.now+10)).to eq false
  end

end