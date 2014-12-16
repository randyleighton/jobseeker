describe "user sign up", type: :feature do
  
  scenario "will successfully allow a user to sign up" do
    binding.pry
    user = FactoryGirl.create(:user)
    register_user(user)
    expect(page).to have_content 'Logged in as'
  end

  scenario "will allow the registered user to sign in" do
    user = FactoryGirl.create(:user)
    sign_in_user(user)
    expect(page).to have_content 'Logged in as'
  end

end