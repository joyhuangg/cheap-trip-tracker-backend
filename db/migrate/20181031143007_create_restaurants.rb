class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :image_url
      t.string :name
      t.string :url
      t.float :rating
      t.string :longitude
      t.string :latitude
      t.string :address
      t.float :price
      t.string :cuisines
      t.string :yelp_id

      t.timestamps
    end
  end
end
