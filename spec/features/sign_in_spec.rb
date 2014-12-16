describe "user sign up", type: :feature do
  
  scenario "will successfully allow a user to sign up" do
    user = FactoryGirl.create(:user)
    register_user(user.email, user.username, user.password, user.password)
    expect(page).to have_content 'Logged in as'
  end

  scenario "will allow the registered user to sign in" do
    user = FactoryGirl.create(:user)
    sign_in_user(user.email, user.password)
    expect(page).to have_content 'Signed in successfully.'
  end

end