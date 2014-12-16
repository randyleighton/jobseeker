module Features
  module SessionHelpers
    def register_user(user)
      visit '/users/sign_up'
      fill_in 'user_email', with: user.email
      fill_in 'user_username', with: user.username
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password
      click_button 'Create my Account'
    end

    def sign_in_user(user)
      visit '/users/login'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log In'
    end
  end
end