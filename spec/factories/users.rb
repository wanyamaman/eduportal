FactoryGirl.define do
  factory :user do
    name "Test User"
    sequence(:email) { |n| "user-#{n}@example.com"}
    password "please123"

    trait :admin do
      role 'admin'
    end

    trait :moderator do
      role 'moderator'
    end

  end
end
