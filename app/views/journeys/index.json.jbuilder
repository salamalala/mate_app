json.array!(@journeys) do |journey|
  json.extract! journey, :id, start_date, :end_date, :start_port_latitude, :end_port_latitude, :start_address, :start_city, start_country, :end_address, :end_city, :title, :description, :deal, :berth
  json.url journey_url(journey, format: :json)
end
