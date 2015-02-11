class Journey < ActiveRecord::Base
  has_many :bookings
  belongs_to :boat
  has_many :users, through: :bookings

  before_save :geocode_addresses

  #takes all attributes and turns them into a string for google search
  def start_full_address
    [start_address, start_city, country].compact.join(', ')
  end

  def end_full_address
    [end_address, end_city, country].compact.join(', ')
  end

  def start_full_address_changed?
    [start_address_changed?, start_city_changed?, country_changed?].any?
  end

  def end_full_address_changed?
    [end_address_changed?, end_city_changed?, country_changed?].any?
  end


#give a long and latitude to start full adress and end full adress. 
# Send: When the method is identified by a string, the string is converted to a symbol. 
  private
  def geocode_addresses
    %w(start end).each do |port|
      if send("#{port}_address_changed?")
        coords = Geocoder.coordinates(send("#{port}_full_address"))
        send("#{port}_port_latitude=", coords[0])
        send("#{port}_port_longitude=", coords[1])
      end
    end

    # if start_address_changed?
    #   coords = Geocoder.coordinates(self.start_full_address)
    #   self.start_port_latitude = coords[0]
    #   self.start_port_longitude = coords[1]
    # end

    # if end_address_changed?
    #   coords = Geocoder.coordinates(self.end_full_address)
    #   self.end_port_latitude = coords[0]
    #   self.end_port_longitude = coords[1]
    # end
  end


end
