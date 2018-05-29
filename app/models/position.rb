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

class Position < ActiveRecord::Base
  # validation
  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :latitude, numericality: true
  validates :longitude, numericality: true
end
