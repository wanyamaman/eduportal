Geocoder.configure(
  :units => :km,
  :cache => Rails.cache,
  :lookup => :test
)

Geocoder::Lookup::Test.add_stub(
  "Broadway New York, NY,", [
    {
      'latitude'     => 40.7143528,
      'longitude'    => -74.0059731,
      'address'      => 'New York, NY, USA',
      'street' => 'Broadway',
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
      'address'      => 'New York, NY, USA',
      'street' => 'Broadway',
      'city' => 'New York',
      'state' => 'New York',
      'state_code'   => 'NY',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)
