# frozen_string_literal: true

# fetches data from the plant rack
# and saves it to the database
class GetPlantRackStateJob < ApplicationJob
  queue_as :default

  def perform
    request = Faraday.get('http://192.168.0.114/')

    parsed_response = JSON.parse(request.body, symbolize_names: true)

    PlantRack::UpdateState.new(rack_data: parsed_response).call
  end
end
