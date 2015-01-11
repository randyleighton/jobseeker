feature 'Home page', type: :feature do
  scenario 'visit the home page' do
    visit root_path
    expect(page).to have_content 'Log In or Create Account'
  end

end