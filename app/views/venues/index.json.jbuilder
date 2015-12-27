json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :full_address, :region_id
  json.url venue_url(venue, format: :json)
end
