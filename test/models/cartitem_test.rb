# == Schema Information
#
# Table name: cartitems
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  item_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_cartitems_on_item_id  (item_id)
#  index_cartitems_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#

require 'test_helper'

class CartitemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
