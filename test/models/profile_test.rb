# == Schema Information
#
# Table name: profiles
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  name          :string(255)      not null
#  name_kana     :string(255)      not null
#  postal_code   :string(255)      not null
#  prefecture_id :string(255)      not null
#  city          :string(255)      not null
#  street        :string(255)      not null
#  others        :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
