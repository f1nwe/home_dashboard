# frozen_string_literal: true

# fetches data from the plant rack
# and saves it to the database
class GetPlantRackStateJob < ApplicationJob
  queue_as :default

  def perform
    request = plant_rack_state_request

    rack_data = JSON.parse(request.body, symbolize_names: true)
                    .deep_transform_keys { |key| key.to_s.underscore.to_sym }
                    .then { |data| data.fetch(:plant_rack) }

    Sidekiq.logger.debug(raw_data: rack_data)

    plant_rack = PlantRack.current || PlantRack::CreateVersion.new(rack_data: rack_data).call

    PlantRack::AddSensorsMeasurements.new(plant_rack, rack_data: rack_data).call
  end

  private

  def plant_rack_state_request
    attempt = 0
    Faraday.get('http://192.168.0.114/')
  rescue Faraday::ConnectionFailed
    Sidekiq.logger.warn('Could not connect fetch plant rack state, retrying in 3 seconds')

    sleep 3

    attempt += 1
    retry if attempt < 5
  end
end
