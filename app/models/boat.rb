class Boat < ActiveRecord::Base
  belongs_to :user
  has_many :journeys
  has_many :bookings, through: :users

  mount_uploader :boat_image, BoatImageUploader
end
