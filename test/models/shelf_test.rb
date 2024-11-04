# == Schema Information
#
# Table name: shelves
#
#  id            :bigint           not null, primary key
#  arrangement   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  plant_rack_id :bigint           not null
#
# Indexes
#
#  index_shelves_on_plant_rack_id  (plant_rack_id)
#
# Foreign Keys
#
#  fk_rails_...  (plant_rack_id => plant_racks.id)
#
require "test_helper"

class ShelfTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
