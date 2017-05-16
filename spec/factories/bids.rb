FactoryGirl.define do
  factory :bid do
    price 3
    association :user, factory: :user
    association :auction, factory: :auction
  end
end
