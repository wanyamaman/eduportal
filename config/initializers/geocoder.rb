Geocoder.configure(
  :units => :km,
  :cache => Rails.cache,
  :lookup => Rails.env.test? ? :test : :google,
  :api_key => ENV["google_api_key"]
)

# New york city stubs
Geocoder::Lookup::Test.add_stub(
  "Broadway, New York, NY, United States", [
    {
      'latitude'     => 40.7143528,
      'longitude'    => -74.0059731,
      'address'      => 'New York, NY, United States',
      'street_address' => 'Broadway',
      'city' => 'New York',
      'state' => 'New York',
      'state_code'   => 'NY',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)
Geocoder::Lookup::Test.add_stub(
  [40.7143528, -74.0059731], [
    {
      'latitude'     => 40.7143528,
      'longitude'    => -74.0059731,
      'address'      => 'New York, NY, United States',
      'street_address' => 'Broadway',
      'city' => 'New York',
      'state' => 'New York',
      'state_code'   => 'NY',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)

# Worthington, Ohio stubs
Geocoder::Lookup::Test.add_stub(
  "Worthington, OH, United States", [
    {
      'latitude'     => 40.09846115112305,
      'longitude'    => -83.01747131347656,
      'address'      => 'Worthington, United States',
      'street_address' => '',
      'city' => 'Worthington',
      'state' => 'Ohio',
      'state_code'   => 'OH',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)
Geocoder::Lookup::Test.add_stub(
  [40.09846115112305, -83.01747131347656], [
    {
      'latitude'     => 40.09846115112305,
      'longitude'    => -83.01747131347656,
      'address'      => 'Worthington, OH, United States',
      'street_address' => '',
      'city' => 'Worthington',
      'state' => 'Ohio',
      'state_code'   => 'OH',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)
