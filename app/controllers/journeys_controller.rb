class JourneysController < ApplicationController
  before_action :set_journey, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @journeys = Journey.all
    respond_with(@journeys)
  end

  def show
    @booking = Booking.new
    respond_with(@journey, @booking)
  end

  def new
    @journey = Journey.new
    respond_with(@journey)
  end

  def edit
  end

  def create
    @journey = Journey.new(journey_params)
    @journey.save
    respond_with(@journey)
  end

  def update
    @journey.update(journey_params)
    respond_with(@journey)
  end

  def destroy
    @journey.destroy
    respond_with(@journey)
  end

  private
    def set_journey
      @journey = Journey.find(params[:id])
    end

    def journey_params
      params.require(:journey).permit(:start_date, :end_date, :start_port_latitude, :end_port_latitude, :start_address, :start_city, :start_country, :end_address, :end_city, :end_country, :title, :description, :deal, :berth, :start_port_longitude, :end_port_latitude)
    end
end
