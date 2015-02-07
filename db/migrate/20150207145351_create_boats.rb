class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :boat_image
      t.string :description

      t.timestamps
    end
  end
end
