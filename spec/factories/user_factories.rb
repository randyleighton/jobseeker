FactoryGirl.define do

  factory :user do
  	username Faker::Internet.user_name
    email Faker::Internet.email
    password Faker::Internet.password
    password_confirmation { password }
  end

  factory :company do
    name Faker::Company.name
    url Faker::Internet.url
  end

  factory :contact do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    title Faker::Name.title
    email Faker::Internet.email("Tester")
    cell_phone Faker::PhoneNumber.cell_phone
    work_phone Faker::PhoneNumber.phone_number
  end

  factory :job do
    description "Ruby Rails developer"
    location "portland, or"
    posting_url "WWW.CODE.COM"
    application_date Faker::Date.between(2.days.ago, Date.today)
    status "open"

  end

  factory :interview do
    notes "This is interview notes"
    interview_date "2014/12/14"
    interview_time "00:38:07 -0800"
    contact_id 1
  end

  factory :response do
    response_date Faker::Date.forward(1)
    notes "This is a response test"
  end

  factory :reminder do
    subject "Call them tomorrow"
    due_date Faker::Date.forward(1)
  end


end
