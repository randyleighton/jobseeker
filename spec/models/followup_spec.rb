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

  it "should not create a followup action in the future" do
    followup_future = FactoryGirl.build(:followup, follow_id: company.id, follow_type: "Company", action_date: DateTime.now+10)
    expect(followup_future.save).to eq false
    expect(followup.update_attributes(action_date: DateTime.now+10)).to eq false
  end

  it "should not update a followup action in the future" do
    expect(followup.update_attributes(action_date: DateTime.now+10)).to eq false
  end

  it "[4.2 validate] should not create a followup action in the future" do
    fol = Followup.new(action: "Run", notes:"Jump", action_date: DateTime.now+10)
    fol.validate
    expect(fol.errors[:action_date]).to_not be_empty
  end

  it "[4.2 validate with FactoryGirl] should not create a followup action in the future" do
    fol = FactoryGirl.build(:followup, action_date: DateTime.now+5)
    fol.validate
    expect(fol.errors[:action_date]).to_not be_empty
  end

  it "should create an action if not in the future" do
    followup_past = FactoryGirl.create(:followup, follow_id: company.id, follow_type: "Company", action_date: DateTime.now-1)
    expect(followup_past).to be_valid
  end

end




