class AddDealconfirmationAndBerthbookedToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :dealconfirmation, :boolean
    add_column :bookings, :berthbooked, :integer
  end
end
