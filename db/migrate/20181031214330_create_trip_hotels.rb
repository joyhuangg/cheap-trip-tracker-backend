class CreateTripHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_hotels do |t|
      t.integer :trip_id
      t.integer :hotel_id

      t.timestamps
    end
  end
end
