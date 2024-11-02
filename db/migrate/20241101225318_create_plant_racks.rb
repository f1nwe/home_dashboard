class CreatePlantRacks < ActiveRecord::Migration[7.2]
  def change
    create_table :plant_racks do |t|
      t.integer :version

      t.timestamps
    end
  end
end
