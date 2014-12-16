feature 'Job Creation', type: :feature do

  scenario 'must be created between application date and today to be valid' do
    user = FactoryGirl.create(:user)
    sign_in_user(user.email, user.password)
    company = FactoryGirl.create(:company, user_id: user.id)
    visit company_path(company)
    create_job(company,user)
    job = Job.all.last
    expect(job.description).to eq 'Rails Developer'
  end

end