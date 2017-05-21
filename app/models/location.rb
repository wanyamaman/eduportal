class Location < ApplicationRecord
  belongs_to :state, counter_cache: true
  after_validation :reverse_geocode, if: (
                          :coordinates_present? && :coordinates_changed?)
  after_validation :geocode, unless: :coordinates_present?

  # Require state, city and country info if no coordinates are passed
  with_options unless: :coordinates_present? do |loc|
    loc.validates :state, presence: {
      message: "can't be blank if no coordinates are provided"
    }
    loc.validates :city, presence: {
      message: "can't be blank if no coordinates are provided"
    }
    loc.validates :country, presence: {
      message: "can't be blank if no coordinates are provided"
    }
  end

  geocoded_by :address, latitude: :fetched_latitude, longitude: :fetched_longitude
  # Based on google maps response,
  # see https://developers.google.com/maps/documentation/geocoding/start#reverse
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.street = geo.street_address || ''
      obj.city = geo.city || ''
      obj.state = State.find_or_create_by(name: geo.state) unless geo.state.blank?
      obj.country = geo.country || ''
      obj.zip = geo.postal_code || ''
    end
  end

  # human readable address
  def address
    state_name = state.name if state
    [street, city, state_name, country, zip].select(&:present?).join(', ')
  end

  private

    def coordinates_present?
      latitude.present? && longitude.present?
    end

    def coordinates_changed?
      latitude_changed? || longitude_changed?
    end
end
