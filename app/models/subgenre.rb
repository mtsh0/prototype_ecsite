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

class Subgenre < ActiveRecord::Base
  belongs_to :genre
  has_many :item
end
