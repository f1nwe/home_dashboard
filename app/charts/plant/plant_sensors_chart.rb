# frozen_string_literal: true

class Plant < ApplicationRecord
  class PlantSensorsChart
    attr_reader :plant

    def initialize(plant)
      @plant = plant
    end

    def as_json
      [
        {
          name: 'Soil Moisture (normalized)',
          data: plant.sensors_measurements.pluck(:created_at, :soil_moisture_normalized)
        },
        {
          name: 'Soil Moisture (raw)',
          data: plant.sensors_measurements.pluck(:created_at, :soil_moisture_raw)
        },
        {
          name: 'Light',
          data: plant.sensors_measurements.pluck(:created_at, :light).map { |light| light ? 4095 : 0 }
        }
      ]
    end
  end
end
