describe "user sign up", type: :feature do
  



  scenario "will successfully allow a user to sign up" do
    user = FactoryGirl.create(:user)
    register_user("fake@yahoo.com", user.username, user.password, user.password)
    save_and_open_page
    expect(page).to have_content 'You have signed up successfully.'
  end

  scenario "will allow the registered user to sign in" do
    user = FactoryGirl.create(:user)
    sign_in_user(user.email, user.password)
    expect(page).to have_content 'Signed in successfully.'
  end

end