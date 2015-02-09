class AddStartPortLongitudeAndEndPortLongitudeToJourney < ActiveRecord::Migration
  def change
    add_column :journeys, :start_port_longitude, :float
    add_column :journeys, :end_port_longitude, :float
  end
end
