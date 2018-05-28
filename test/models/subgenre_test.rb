# == Schema Information
#
# Table name: subgenres
#
#  id         :integer          not null, primary key
#  genre_id   :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class SubgenreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
