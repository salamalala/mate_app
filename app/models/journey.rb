class Journey < ActiveRecord::Base
  has_many :bookings
  belongs_to :boat
  has_many :users, through: :bookings


  geocoded_by :start_full_address, latitude: :start_latitude, longitude: :start_longitude
  geocoded_by :end_full_address, latitude: :end_latitude, longitude: :end_longitude

  def start_full_address
    [start_address, start_city, start_country].compact.join(', ')
  end

  def end_full_address
    [end_address, end_city, end_country].compact.join(', ')
  end

end
