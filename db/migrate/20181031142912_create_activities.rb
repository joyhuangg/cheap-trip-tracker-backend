class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :link
      t.string :snippet
      t.integer :trip_id

      t.timestamps
    end
  end
end
