class CreateBars < ActiveRecord::Migration[5.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.boolean :wifi
      t.timestamps
    end
  end
end
