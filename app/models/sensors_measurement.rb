# frozen_string_literal: true

# == Schema Information
#
# Table name: sensors_measurements
#
#  id                       :bigint           not null, primary key
#  light                    :boolean
#  soil_moisture_normalized :integer
#  soil_moisture_raw        :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  plant_id                 :bigint           not null
#
# Indexes
#
#  index_sensors_measurements_on_plant_id  (plant_id)
#
# Foreign Keys
#
#  fk_rails_...  (plant_id => plants.id)
#
class SensorsMeasurement < ApplicationRecord
  belongs_to :plant
end
