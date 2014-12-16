feature 'Navigation links', type: :feature do
  scenario 'view navigation links not logged in' do
    visit root_path
    expect(page).to have_content 'Companies'
    expect(page).to have_content 'Contacts'
    expect(page).to have_content 'Jobs'
    expect(page).to have_content 'Interviews'
    expect(page).to have_content 'Sign Up'
    expect(page).to have_content 'Log In'
    expect(page).to have_content 'Home'
  end

  scenario 'view navigation links when logged in' do
    user = FactoryGirl.create(:user)
    visit new_user_registration_path
    sign_in_user(user.email, user.password)
    visit root_path
    expect(page).to have_content 'Companies'
    expect(page).to have_content 'Contacts'
    expect(page).to have_content 'Jobs'
    expect(page).to have_content 'Interviews'
    expect(page).to have_content 'Edit Profile'
    expect(page).to have_content 'Logout'
  end

end