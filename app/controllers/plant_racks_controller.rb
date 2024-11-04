# frozen_string_literal: true

class PlantRacksController < ApplicationController
  def index
    @plant_rack = PlantRack.current
  end
end
