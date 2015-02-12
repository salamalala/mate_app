class AddBoatIdToJourney < ActiveRecord::Migration
  def change
    add_column :journeys, :boat_id, :integer
  end
end
