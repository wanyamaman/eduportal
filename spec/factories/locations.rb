FactoryGirl.define do
  factory :location do
    street 'Broadway'
    city "New York"
    latitude 40.7143528
    longitude -74.0059731
    association :state, strategy: :build
  end
end
