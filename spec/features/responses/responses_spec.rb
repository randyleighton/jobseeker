feature 'Response Creation', type: :feature do

  scenario 'must be created between application date and today to be valid' do
    user = FactoryGirl.create(:user)
    sign_in_user(user.email, user.password)
    company = FactoryGirl.create(:company, user_id: user.id)
    job = FactoryGirl.create(:job, user_id: user.id, company_id: company.id)
    visit new_job_response_path(job)
    fill_in 'response_response_date', with: DateTime.now
    fill_in 'response_notes', with: 'they want to meet'
    click_button 'Create Response'
    expect(page).to have_content 'Notes: they want to meet'
  end

end