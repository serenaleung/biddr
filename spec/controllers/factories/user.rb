FactoryGirl.define do
  factory :user do
    name             {Faker::Name.first_name}
    sequence(:email) {|n| "#{n}-#{Faker::Internet.email}"}
    password         {Faker::Internet.password}
  end
end
