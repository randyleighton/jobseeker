describe User do

  it { should have_many :companies }
  it { should have_many(:jobs).through(:companies) }
  it { should have_many(:interviews).through(:companies) }
  it { should have_many :feedbacks }
  it { should validate_presence_of :email }


  describe "signup_confirmation" do
    user = User.new({username: "John", email: "john@yahoo.com", 
                password:"test1234", password_confirmation: "test1234"})
    let(:mail) { UserMailer.signup_confirmation(user) }

      it "renders the headers" do
        expect(mail.subject).to eq("Welcome to My Jobseeker")
        expect(mail.to).to eq(["john@yahoo.com"])
        expect(mail.from).to eq(["postmaster@sandbox125040c2263144c7a0c152df1aedc874.mailgun.org"])
      end
  end

end