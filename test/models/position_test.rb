# == Schema Information
#
# Table name: positions
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  address     :string(255)
#  latitude    :float(24)
#  longitude   :float(24)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class PositionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
