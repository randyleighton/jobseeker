feature 'Home page', type: :feature do
  scenario 'visit the home page' do
    visit root_path
    expect(page).to have_content 'Welcome to the Jobseeker'
  end

end