class Booking < ActiveRecord::Base
  belongs_to :user
  has_one :rating
  belongs_to :journey
  has_one :boat, through: :journey

  after_save :sum_up_bookings_of_journey

#total amount of berth: journey.berth, amount of berth booked: journey_berth_booked, still available berth journey.berth - journey_berth_booked, after booking add up to journey_berth_booking
  def sum_up_bookings_of_journey
    @journey = Journey.find(@booking.journey_id)
    @journey.journey_berth_booked += @booking.berthbooked
    @journey.save
  end





    
    
  



end
