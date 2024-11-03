# frozen_string_literal: true

class CreatePlantRacks < ActiveRecord::Migration[7.2]
  def change
    create_table :plant_racks do |t|
      t.float :version, null: false
      t.jsonb :raw_data

      t.timestamps
    end
  end
end
