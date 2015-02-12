class AddJourneyIdToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :journey_id, :integer
  end
end
