class String #this is for terminal colors to spruce things up!
  def black;          "\033[30m#{self}\033[0m" end
  def green;          "\033[32m#{self}\033[0m" end
  def magenta;        "\033[35m#{self}\033[0m" end
end

# Destroy Existing Data
print "Cleaning Database".magenta
User.destroy_all
print "..."
Company.destroy_all
print "..."
Job.destroy_all
print "..."
Contact.destroy_all
print "..."
Response.destroy_all
print "..."
Interview.destroy_all
print "..."
Account.destroy_all
print "..."
puts "Done.".green

# Create New Data
print "Seeding Database".magenta
user1 = User.create(email: "randyleighton@yahoo.com", username:"Randy", password: "test1234")
print "..."
company1 = Company.create(name: "Coding Academy", url:"www.code.com", comments:"coding company", user_id: user1.id)
print "..."
company2 = Company.create(name: "Dogma Coders", url: "www.dogma.com", comments:"only the best", user_id: user1.id)
print "..."
job1 = Job.create(description: "Ruby Rails Developer", location: "Portland, OR", company_id: company2.id,
                  posting_url: "http:/www.indeed.com", application_date: 5.days.ago, user_id: user1.id)
print "..."
contact1 = Contact.create(first_name: "George", last_name: "Georgeson", title: "Recruiter", 
                          email:"George@#{company1.name}.com", notes:"this is the one who hires people", 
                          company_id: company1.id, user_id: user1.id)
account1 = Account.create(contact_id: contact1.id, user_id: user1.id, description: "Linked In", info: "www.linkedin.com/in/george")
print "..."
response1 = Response.create(notes: "We want to interview you", response_date: 1.day.ago, job_id: job1.id,
                            user_id: user1.id, contact_id: contact1.id)
print "..."
interview1 = Interview.create(interview_date: DateTime.now+5, notes: "Interview with the VP", 
                               interview_time: "12:00 PM", job_id: job1.id, user_id: user1.id)
print "..."
puts "Done.".green
puts "Created " + "#{Company.count}".green + " Companies,".black + " #{Job.count}".green + " jobs,".black + " #{Contact.count}".green + 
  " Contacts,".black + " #{Response.count}".green + " Responses,".black + " #{Interview.count}".green + " Interviews,".black + " #{Account.count}".green + " Contact Accounts"

