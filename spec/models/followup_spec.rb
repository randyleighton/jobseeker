describe Followup do

  it { should belong_to :follow }
  it { should validate_presence_of :action }

let!(:company) { FactoryGirl.create(:company, name:"Beta", url: "www.beta.com") }

  it "should create a followup" do
    followup = FactoryGirl.create(:followup, follow_id: company.id)
    expect(Followup.all).to eq [followup]
  end
  it "should display followups in newest first order on index page" do
    followup = FactoryGirl.create(:followup, follow_id: company.id, action: "Oldest Action")
    followup2 = FactoryGirl.create(:followup, follow_id: company.id,action:"Newest Action")
    expect(Followup.all.order_by).to eq [followup2, followup]
  end


end