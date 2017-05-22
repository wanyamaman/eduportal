module LocationsHelper
  # Generate url for embeded google map based on location
  def google_map_embed(location)
    "https://www.google.com/maps/embed/v1/place?key=#{ENV["google_api_key"]}&q=#{location.address}&center=#{location.latitude},#{location.longitude}"
  end
end
