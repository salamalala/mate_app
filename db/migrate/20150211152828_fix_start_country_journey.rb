class FixStartCountryJourney < ActiveRecord::Migration
  def change
    rename_column :journeys, :start_country, :country
  end
end
