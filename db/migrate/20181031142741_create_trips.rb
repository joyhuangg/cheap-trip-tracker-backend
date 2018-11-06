class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.integer :user_id
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.integer :num_ppl
      t.float :price
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
