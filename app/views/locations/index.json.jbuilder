json.array!(@locations) do |location|
  json.extract! location, :id, :street, :city, :state, :country, :zip, :latitude, :longitude
  json.url location_url(location, format: :json)
end
