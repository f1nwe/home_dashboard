# frozen_string_literal: true

# == Schema Information
#
# Table name: plant_racks
#
#  id         :bigint           not null, primary key
#  raw_data   :jsonb
#  version    :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PlantRack < ApplicationRecord
  validates :version, presence: true, uniqueness: true

  has_many :shelves, -> { order(:arrangement) }, dependent: :destroy
  has_many :plants, through: :shhelves

  def self.current
    order(version: :desc).first
  end
end
