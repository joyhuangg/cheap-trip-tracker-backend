class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :origin
      t.string :destination
      t.datetime :departure_date
      t.datetime :return_date
      t.string :flight_number
      t.string :operating_airline
      t.float :price
      t.integer :trip_id

      t.timestamps
    end
  end
end
