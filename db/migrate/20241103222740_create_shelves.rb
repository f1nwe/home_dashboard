class CreateShelves < ActiveRecord::Migration[7.2]
  def change
    create_table :shelves do |t|
      t.references :plant_rack, null: false, foreign_key: true
      t.integer :arrangement

      t.timestamps
    end
  end
end
