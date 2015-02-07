class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.date :start_date
      t.date :end_date
      t.float :start_port_latitude
      t.float :end_port_latitude
      t.string :start_address
      t.string :start_city
      t.string :start_country
      t.string :end_address
      t.string :end_city     
      t.string :end_country
      t.string :title
      t.text :description
      t.string :deal

      t.timestamps
    end
  end
end
