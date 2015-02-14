class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @boats = Boat.all
    @journeys = Journey.all
    respond_with(@boats)
  end

  def show
    respond_with(@boat)
  end

  def new
    @boat = Boat.new
    respond_with(@boat)
  end

  def edit
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    @boat.save
    respond_with(@boat)
  end

  def update
    @boat.update(boat_params)
    respond_with(@boat)
  end

  def destroy
    @boat.destroy
    respond_with(@boat)
  end

  private
    def set_boat
      @boat = Boat.find(params[:id])
    end

    def boat_params
      params.require(:boat).permit(:boat_image, :description, :remote_boat_image_url)
    end
end
