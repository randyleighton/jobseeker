module Features
  module SessionHelpers
    def register_user(email,username, password, password_confirmation)
      visit new_user_registration_path
      fill_in 'user_email', with: email
      fill_in 'user_username', with: username
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password_confirmation
      click_button 'Create my Account'
    end

    def sign_in_user(email, password)
      visit new_user_session_path
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      click_button 'Log In'
    end
  end
end