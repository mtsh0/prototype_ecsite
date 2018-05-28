# == Schema Information
#
# Table name: contacts
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  type        :string(255)
#  titile      :string(255)
#  description :string(255)
#  image       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
