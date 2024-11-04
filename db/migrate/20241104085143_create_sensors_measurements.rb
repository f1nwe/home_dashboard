# frozen_string_literal: true

class CreateSensorsMeasurements < ActiveRecord::Migration[7.2]
  def change
    create_table :sensors_measurements do |t|
      t.integer :soil_moisture_normalized
      t.integer :soil_moisture_raw

      t.boolean :light
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
