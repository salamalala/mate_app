class Booking < ActiveRecord::Base
  belongs_to :user
  has_one :rating
  belongs_to :journey
  has_one :boat, through: :journey

end
