class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end
