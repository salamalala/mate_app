class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @bookings = Booking.all
    @journeys = Journey.all
    respond_with(@bookings)
  end

  def show
    respond_with(@booking)
  end

  def new
    @booking = Booking.new
    respond_with(@booking)
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "Requested"
    @booking.user_id = current_user.id
    @booking.save
    respond_with(@booking)
  end

  def update
    @booking.update(booking_params)
    respond_with(@booking)
  end

  def destroy
    @booking.destroy
    respond_with(@booking)
  end

  def approve_booking
    @booking = Booking.find(params[:id])
    @booking.status = "Approved"
    @booking.save
    redirect_to bookings_path
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:comment, :journey_id, :berthbooked, :dealconfirmation)
    end
end
