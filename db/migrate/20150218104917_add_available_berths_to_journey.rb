class AddAvailableBerthsToJourney < ActiveRecord::Migration
  def change
    add_column :journeys, :available_berths, :integer
  end
end
