# frozen_string_literal: true

class PlantRack < ApplicationRecord
  # adds sensors measurements from the esp32 rack to db
  class AddSensorsMeasurements
    attr_reader :rack_data, :plant_rack

    def initialize(plant_rack, rack_data:)
      @plant_rack = plant_rack
      @rack_data = rack_data
    end

    def call
      sensors_values_to_import = []

      plant_rack.shelves.each do |shelf|
        shelf_data = rack_data.fetch(:shelves).fetch(shelf.arrangement)
        next unless shelf_data.fetch(:invoked)

        shelf.plants.each do |plant|
          plant_data = shelf_data.fetch(:plants).fetch(plant.arrangement)

          sensors_values_to_import << plant.sensors_measurements.build(
            light: shelf_data.fetch(:light),
            soil_moisture_normalized: plant_data.fetch(:humidity).fetch(:average),
            soil_moisture_raw: plant_data.fetch(:humidity).fetch(:current)
          )
        end
      end

      SensorsMeasurement.import(sensors_values_to_import)
    end
  end
end
