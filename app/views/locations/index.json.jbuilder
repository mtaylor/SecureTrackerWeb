json.array!(@locations) do |location|
  json.extract! location, :id, :longitude, :latitude, :time, :user_id
  json.url location_url(location, format: :json)
end
