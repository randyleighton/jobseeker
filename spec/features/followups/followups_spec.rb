feature 'Followup Creation', type: :feature do

let(:user) { FactoryGirl.create(:user) }
let(:company) { FactoryGirl.create(:company, user_id: user.id) }

  scenario 'must be created with a current or past date' do
    sign_in_user(user.email, user.password)
    visit company_path(company)
    find(:xpath, "//a[contains(@href,'/companies/#{company.id}/followups/new')]").click
    fill_in 'followup[action]', with: 'Called George'
    fill_in 'followup[notes]', with: 'Had a great call about nothing.'
    fill_in 'followup[action_date]', with: DateTime.now
    click_button 'Create Followup'
    expect(page).to have_content 'The followup has been logged successfully'
  end

scenario 'must not be created with a future date' do
    sign_in_user(user.email, user.password)
    visit company_path(company)
    find(:xpath, "//a[contains(@href,'/companies/#{company.id}/followups/new')]").click
    fill_in 'followup[action]', with: 'Called George'
    fill_in 'followup[notes]', with: 'Had a great call about nothing.'
    fill_in 'followup[action_date]', with: DateTime.now+10
    click_button 'Create Followup'
    expect(page).to have_content 'can not be in the future'
  end

end