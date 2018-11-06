class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :longitude
      t.string :latitude
      t.string :address
      t.float :price
      t.string :property_name


      t.timestamps
    end
  end
end
