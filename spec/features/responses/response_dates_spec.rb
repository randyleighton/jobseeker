feature 'Response Creation', type: :feature do

  scenario 'must be created between application date and today to be valid' do
    user = FactoryGirl.create(:user)
    sign_in_user(user.email, user.password)
    company = FactoryGirl.create(:company, user_id: user.id)

    # save_and_open_page
  end

end