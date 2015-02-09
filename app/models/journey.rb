class Journey < ActiveRecord::Base
  has_many :bookings
  belongs_to :boat
  has_many :users, through: :bookings


  geocoded_by :start_full_address, latitude: :start_port_latitude, longitude: :start_longitude

  geocoded_by :end_full_address, latitude: :end_port_latitude, longitude: :end_longitude

  #specifies when to do the actual geo coding. 
  after_validation :geocode

  #takes all attributes and turns them into a string for google search
  def start_full_address
    [start_address, start_city, start_country].compact.join(', ')
  end

  def end_full_address
    [end_address, end_city, end_country].compact.join(', ')
  end

end
