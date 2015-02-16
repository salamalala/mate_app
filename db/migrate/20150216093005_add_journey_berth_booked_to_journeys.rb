class AddJourneyBerthBookedToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :journey_berth_booked, :integer
  end
end
