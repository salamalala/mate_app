json.array!(@journeys) do |journey|
  json.extract! journey, :id, :start, :end, :start_port_latitude, :end_port_latitutude, :start_address, :start_city, :end_address, :end_city, :start_country, :end_country, :title, :description, :deal, :comment
  json.url journey_url(journey, format: :json)
end
