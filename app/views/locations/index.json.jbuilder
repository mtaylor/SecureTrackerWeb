json.array!(@locations) do |location|
  json.extract! location, :id, :longitude, :latitude, :time, :user
  json.url location_url(location, format: :json)
end
