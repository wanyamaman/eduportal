FactoryGirl.define do

  factory :school do
    name "Test School primary"
    sequence(:email) { |n| "school#{n}@example.com"}
    mode "day"
    level "secondary"
    gender "mixed"
    ownership "private"
    phone 12345678
    about "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit dolores dolorem fugiat inventore est libero, voluptate, sequi nostrum sapiente sunt ipsum! Eveniet delectus tempora inventore dolor libero, temporibus nobis perferendis?"
    association :location, strategy: :build

    trait :with_logo do
      logo Rack::Test::UploadedFile.new(File.open(
            File.join(Rails.root, '/spec/support/files/logo.jpg')))
    end

    trait :with_banner do
      banner Rack::Test::UploadedFile.new(File.open(
                File.join(Rails.root, '/spec/support/files/banner.jpg')))
    end

    factory :jms do
      name "JMS"
      email "jms@jmshigh.bw"
      level "all"
      news "JMS Fire win the Francistown soccer world cup!"
    end
  end

end
