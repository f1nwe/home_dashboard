# frozen_string_literal: true

class PlantRack < ApplicationRecord
  # ensures that received data is valid for latest version of the plant rack
  # saved in the database, addes new date to the database if it is. If it is not
  # valid, will warn the user
  class UpdateState
    attr_reader :rack_data

    def initialize(rack_data:)
      @rack_data = rack_data
    end

    def call
      Sidekiq.logger.debug(rack_data)
    end
  end
end
