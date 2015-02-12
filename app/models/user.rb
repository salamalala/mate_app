class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  has_many :boats
  has_many :journeys, through: :bookings
  has_many :bookings
  has_many :ratings, through: :bookings

  mount_uploader :user_image, UserImageUploader


end
