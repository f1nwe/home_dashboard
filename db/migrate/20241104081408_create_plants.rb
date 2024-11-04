class CreatePlants < ActiveRecord::Migration[7.2]
  def change
    create_table :plants do |t|
      t.references :shelf, null: false, foreign_key: true
      t.string :title
      t.string :number
      t.integer :arrangement

      t.timestamps
    end
  end
end
