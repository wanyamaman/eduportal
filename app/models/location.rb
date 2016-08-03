class Location < ActiveRecord::Base
  belongs_to :state, counter_cache: true
  geocoded_by :address

  # Based on google maps response,
  # see https://developers.google.com/maps/documentation/geocoding/start#reverse
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.street = geo.street_address || ''
      obj.city = geo.city || ''
      obj.state = State.find_or_create_by(name: geo.state)
      obj.country = geo.country || ''
      obj.zip = geo.postal_code || ''
    end
  end

  validates :state, presence: {
      message: 'A state must be assigned to the location'}
  after_validation :geocode, :reverse_geocode

  # human readable address
  # NB: needs truncation of leading,trailing spaces
  def address
    (street + ' ' + city + ', ' + state.name + ', ' + country + ' ' + zip).strip
  end

end
