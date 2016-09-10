class CreateBars < ActiveRecord::Migration[5.0]
  def change
    create_table :bars do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.boolean :wifi
      t.timestamps
    end
  end
end
