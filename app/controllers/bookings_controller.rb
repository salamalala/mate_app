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
    @bookings = Booking.all
    @booking = Booking.new(booking_params)
    @booking.status = "Requested"
    @booking.user_id = current_user.id
    if @booking.save
      @journey = Journey.find(@booking.journey_id)
      @journey.berth -=  @booking.berthbooked
      @journey.save
      @booking.save
      render :index
    else
      render :new
    end
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
