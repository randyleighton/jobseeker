describe "user sign up" do
  
  it "will successfully allow a user to sign up" do
    visit '/users/sign_up'
    save_and_open_page
    fill_in 'user_email', with: 'nacho@libre.com'
    fill_in 'user_username', with: 'Nacho Libre'
    fill_in 'user_password', with: 'test1234'
    fill_in 'user_password_confirmation', with: 'test1234'
    click_button 'Create my Account'
    expect(page).to have_content 'Logged in as Nacho Libre'
  end



end