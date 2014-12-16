module Features
  module SessionHelpers
    def register_user(email,username, password, password_confirmation) #pass in values
      visit new_user_registration_path
      fill_in 'user_email', with: email
      fill_in 'user_username', with: username
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password_confirmation
      click_button 'Create my Account'
    end

    def sign_in_user(email, password) # pass in values
      visit new_user_session_path
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      click_button 'Log In'
    end

    def create_job(company,user) # pass in company,user objects
      app_date = DateTime.now - 2
      visit new_company_job_path(company)
      fill_in 'job_description', with: "Rails developer"
      fill_in 'job_location', with: "Portland, OR"
      fill_in 'job_posting_url', with: "www.test.com"
      fill_in 'job_application_date', with: app_date
      click_button 'Create Job'
    end
  end
end