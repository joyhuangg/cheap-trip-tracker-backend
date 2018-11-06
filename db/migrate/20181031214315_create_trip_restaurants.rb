class CreateTripRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_restaurants do |t|
      t.integer :trip_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
