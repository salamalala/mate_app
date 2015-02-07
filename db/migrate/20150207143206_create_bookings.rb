class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.text :comment
      t.string :status

      t.timestamps
    end
  end
end
