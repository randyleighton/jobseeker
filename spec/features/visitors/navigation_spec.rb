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
    save_and_open_page
  end
end