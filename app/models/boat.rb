class Boat < ActiveRecord::Base
  has_many :users
  has_many :journeys
  has_many :bookings, through: :users
end
