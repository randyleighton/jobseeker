describe "feedback mailer" do

  let!(:user) { FactoryGirl.create(:user, username: "Nacho Nick", email: "nacho@nick.com") }
  let!(:feedback) { FactoryGirl.create(:feedback, user_id: user.id, subject:"Awesome Site", body:"This is the coolest site ever") }
  let(:feedback_message) { AdminMailer.send_feedback(feedback) }
  let(:feedback_confirmation) { AdminMailer.feedback_confirmation(feedback) }

    it "sends a feedback email to the Jobseeker" do
      expect(feedback_message.subject).to eq("Jobseeker User Feedback")
      expect(feedback_message.to).to eq([ENV['visible_difference_admin']])
      expect(feedback_message.from).to eq(["postmaster@sandbox125040c2263144c7a0c152df1aedc874.mailgun.org"])
    end

    it "send the user a confimation email" do
      expect(feedback_confirmation.subject).to eq("Your feedback to The Jobseeker")
      expect(feedback_confirmation.to).to eq([user.email])
      expect(feedback_confirmation.from).to eq(["postmaster@sandbox125040c2263144c7a0c152df1aedc874.mailgun.org"])
    end

end