class JourneysController < ApplicationController
  before_action :set_journey, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @q = Journey.search(params[:q])
    @journeys = @q.result(distinct: true)
    respond_with(@journeys)
    
  end

  def show
    @booking = Booking.new 
    respond_with(@journey, @booking)   
  end

#show user_id for journey.captain

  def new
    @journey = Journey.new
    respond_with(@journey)
  end

  def edit
  end

  def create
    @journey = current_user.journeys_as_captain.new(journey_params)
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

  def weather_at
    @location = params[:location]
    #for start and end location define the city to look up the weather
    if %w(start end).include?(@location)
      set_journey
      @city = @journey.send("#{@location}_city")
    else
      #for current location 
      # go lookup lat and long of current location.
      @journey = Journey.new(current_city: :current, current_port_latitude: params[:lat], current_port_longitude: params[:long])
      @city = 'your current location'
    end

    render layout: false
  end

  private
    def set_journey
      @journey = Journey.find(params[:id])
    end

    def journey_params
      params.require(:journey).permit(:start_date, :end_date, :start_port_latitude, :end_port_latitude, :start_address, :start_city, :country, :end_address, :end_city, :country, :title, :description, :deal, :berth, :start_port_longitude, :end_port_latitude)
    end
end
