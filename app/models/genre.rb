# == Schema Information
#
# Table name: genres
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class Genre < ActiveRecord::Base
  #validation
  validates :name, presence: true

  # relation
  has_many :items
  has_many :subgenres
end
