class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :trackable, :validatable

  has_one :boat
  has_many :journeys, through: :bookings
  has_many :bookings
  has_many :ratings, through: :bookings
  has_many :journeys_as_captain, class_name: 'Journey', foreign_key: :captain_id

  mount_uploader :user_image, UserImageUploader

  def name
    [first_name, last_name].delete_if(&:blank?).join(' ')
  end

  #if i have boat otherwise I build a boat 
  private
  def populate_boat
    self.boat ||= build_boat
  end

  def current_location
    city = request.location.city
  end


end
