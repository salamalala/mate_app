class Journey < ActiveRecord::Base
  has_many :bookings
  belongs_to :boat
  has_many :users, through: :bookings

  accepts_nested_attributes_for :bookings
end
