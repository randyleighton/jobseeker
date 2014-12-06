FactoryGirl.define do

  factory :user do
  	username Faker::Name.username
    email Faker::Internet.email
    password Faker::Internet.password
    password_confirmation { password }
  end

  factory :company do

  end

  factory :contact do

  end

  factory :job do

  end

  factory :interview do

  end

  factory :response do

  end


end
