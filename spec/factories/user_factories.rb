FactoryGirl.define do

  factory :user do
  	username Faker::Internet.user_name
    email "jobseeker@yahoo.com"
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
    cell_phone Faker::PhoneNumber.cell_phone
    work_phone Faker::PhoneNumber.phone_number
  end

  factory :job do
    description "Ruby Rails Developer"
    location Faker::Address.city
    posting_url Faker::Internet.url
    application_date Faker::Date.between(2.days.ago, Date.today)
    status "open"

  end

  factory :interview do
    interview_date Faker::Date.forward(7)

  end

  factory :response do

  end


end
