class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @journeys = Journey.all
  end
  
end