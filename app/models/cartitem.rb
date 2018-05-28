class Cartitem < ActiveRecord::Base
  #validation
  validates :quantity, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 1
  }

  #relation
  belongs_to :user
  belongs_to :item
  belongs_to :order
end
