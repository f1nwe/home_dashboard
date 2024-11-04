# frozen_string_literal: true

class PlantRack < ApplicationRecord
  # Builds new version of plant rack from the esp32 data
  class CreateVersion
    attr_reader :rack_data

    def initialize(rack_data:)
      @rack_data = rack_data
    end

    def call # rubocop:disable Metrics/AbcSize
      latest_version = PlantRack.order(version: :desc).first || 0.1

      PlantRack.transaction do
        rack = PlantRack.create!(version: latest_version + 0.1)

        rack_data[:shelves].each.with_index do |shelf_data, index|
          shelf = rack.shelves.create!(arrangement: index)

          shelf_data[:plants].each.with_index do |_plant_data, plant_index|
            shelf.plants.create!(arrangement: plant_index)
          end
        end
      end
    end
  end
end
