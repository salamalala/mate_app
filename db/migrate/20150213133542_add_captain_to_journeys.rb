class AddCaptainToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :captain_id, :integer
  end
end
