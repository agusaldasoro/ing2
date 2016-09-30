class CreateCharacteristics < ActiveRecord::Migration[5.0]
  def change
    create_table :characteristics do |t|
      t.references :bar, foreign_key: true
      t.float :lat
      t.float :lng
      t.string :value
      t.string :type

      t.timestamps
    end
  end
end
