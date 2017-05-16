FactoryGirl.define do
  factory :item do
    title "Something"
    details "Something more"
    reserve_price 3
    end_date "2017-5-30"
    association :user, factory: :user
  end
end
