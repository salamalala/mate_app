class Booking < ActiveRecord::Base
  belongs_to :user
  has_one :rating
  belongs_to :journey
  has_one :boat, through: :journey

  validates :user_id, uniqueness: {scope: :journey_id }

  validates :dealconfirmation, acceptance: true

  #after creating and updating and deleting
  after_save :sum_up_bookings_of_journey
  after_destroy :sum_up_bookings_of_journey

#total amount of booked berth per journey, 
  def sum_up_bookings_of_journey
    journey.update_berths if journey
  end

  def sum_berthbooked_available_berth
    journey.available_berths + berthbooked
  end




end
