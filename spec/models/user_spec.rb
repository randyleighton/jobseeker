describe User do

  it { should have_many :companies }
  it { should have_many(:jobs).through(:companies) }

  describe "signup_confirmation" do
    user = User.new({username: "John", email: "john@yahoo.com", 
                password:"test1234", password_confirmation: "test1234"})
    let(:mail) { UserMailer.signup_confirmation(user) }

      it "renders the headers" do
        expect(mail.subject).to eq("Sign up for Jobseeker")
        expect(mail.to).to eq(["randyleighton@yahoo.com"])
        expect(mail.from).to eq(["randyleighton@visible-difference.com"])
      end
  end

end