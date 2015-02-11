class RemoveEndCountryFromJourneys < ActiveRecord::Migration
  def change
    remove_column :journeys, :end_country, :string
  end
end
