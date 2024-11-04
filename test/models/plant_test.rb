# == Schema Information
#
# Table name: plants
#
#  id          :bigint           not null, primary key
#  arrangement :integer
#  number      :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  shelf_id    :bigint           not null
#
# Indexes
#
#  index_plants_on_shelf_id  (shelf_id)
#
# Foreign Keys
#
#  fk_rails_...  (shelf_id => shelves.id)
#
require "test_helper"

class PlantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
