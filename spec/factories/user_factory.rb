FactoryGirl.define do
  factory :user do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "user_#{n}" }
    sequence(:birthday) { |n| Date.today + n.days }
  end
end
