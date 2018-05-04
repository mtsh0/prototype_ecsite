class Genre < ActiveRecord::Base
  # relation
  has_many :items
end
