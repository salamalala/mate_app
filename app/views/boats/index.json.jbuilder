json.array!(@boats) do |boat|
  json.extract! boat, :id, :boat_image, :description
  json.url boat_url(boat, format: :json)
end
