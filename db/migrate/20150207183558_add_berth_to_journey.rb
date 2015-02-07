class AddBerthToJourney < ActiveRecord::Migration
  def change
    add_column :journeys, :berth, :integer
  end
end
