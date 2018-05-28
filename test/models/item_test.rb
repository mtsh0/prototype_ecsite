# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  itemCodeNo   :integer
#  partNumber   :string(255)
#  itemName     :string(255)
#  genre_id     :integer
#  subgenre_id  :integer
#  topDispflg   :integer
#  price        :float(24)
#  shippingUnit :integer
#  description  :string(255)
#  attention    :string(255)
#  mainImage    :string(255)
#  image2       :string(255)
#  image3       :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
