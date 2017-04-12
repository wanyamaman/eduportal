FactoryGirl.define do

  factory :school do
    name "Test School primary"
    email "test@testing.com"
    mode "day"
    level "secondary"
    gender "mixed"
    ownership "private"
    phone 12345678
    about "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit dolores dolorem fugiat inventore est libero, voluptate, sequi nostrum sapiente sunt ipsum! Eveniet delectus tempora inventore dolor libero, temporibus nobis perferendis?"
    trait :with_logo do
      logo Rack::Test::UploadedFile.new(File.open(
            File.join(Rails.root, '/spec/support/files/logo.jpg')))
    end
  end

end
