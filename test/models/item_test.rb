# == Schema Information
#
# Table name: items
#
#  id                :integer          not null, primary key
#  itemCodeNo        :integer
#  partNumber        :string(255)
#  itemName          :string(255)
#  price             :float(24)
#  shippingUnit      :integer
#  description       :string(255)
#  attention         :string(255)
#  mainImage         :string(255)
#  image2            :string(255)
#  image3            :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  soft_destroyed_at :datetime
#
# Indexes
#
#  index_items_on_soft_destroyed_at  (soft_destroyed_at)
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
