class Journey < ActiveRecord::Base
  has_many :bookings
  belongs_to :boat
  belongs_to :captain, class_name: 'User'
  has_many :users, through: :bookings
  
  after_save :update_berths

  attr_accessor :current_city, :current_port_latitude, :current_port_longitude

  #validations
  validates :start_date, :end_date, :start_city, :end_city, :country, :deal, :berth, presence: true
  validates :berth, numericality: { greater_than_or_equal_to: 0 }
  validate :end_must_be_after_start
  validate :start_date_in_future

  scope :journeys_in_past, ->  { where('start_date < ?', Date.today)}
  scope :journeys_in_future, ->  {where('start_date >= ?', Date.today)}

  def start_date_in_future
    if start_date && end_date
    errors.add(:start_date, "must be in the future") if start_date < Time.zone.now
    end
  end

  def journey_in_future
    if start_date 
    start_date >= Date.today
    end
  end


  def end_must_be_after_start
    if start_date && end_date
    errors.add(:end_date, "must be after embarking date") if
        end_date <= start_date
    end
  end

 
  #available berth, if nil then 0. 

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



  def weather_at_location(location)
    return @weather_at_location if @weather_at_location

    lat = send("#{location}_port_latitude")
    long = send("#{location}_port_longitude")

    url = "http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}&units=metric&APPID=#{ENV['APP_WEATHER']}"

    @weather_at_location = HTTParty.get(url)

  end

  def weather_temp(location)
    weather_at_location(location)["main"]["temp"] rescue "unknown"
  end

  def weather_main(location)
    weather_at_location(location)["weather"][0]["main"] rescue "unknown"
  end

  def weather_icon(location)
    weather_at_location(location)["weather"][0]["icon"] rescue "unknown"
  end

#ajax: fire off the request to get the view of the weather. 

def calculate_available_berths
  if (self.journey_berth_booked ||=  0) && (self.berth ||=  0)
    berth - journey_berth_booked
  else
    0
  end
end




def update_berths
  update_column(:journey_berth_booked, bookings.sum(:berthbooked))
  update_column(:available_berths, calculate_available_berths) 
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
end

    # if start_address_changed?
      # coords = Geocoder.coordinates(self.start_full_address)
      # self.start_port_latitude = coords[0]
      # self.start_port_longitude = coords[1]
    # end

    # if end_address_changed?
    #   coords = Geocoder.coordinates(self.end_full_address)
    #   self.end_port_latitude = coords[0]
    #   self.end_port_longitude = coords[1]
    # end



  end
