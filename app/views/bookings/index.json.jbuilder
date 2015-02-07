json.array!(@bookings) do |booking|
  json.extract! booking, :id, :comment, :status
  json.url booking_url(booking, format: :json)
end
