class Order < ActiveRecord::Base
  # validation
  validates :d_number, length: {in: 10..12}


  #relation
  belongs_to :user
  belongs_to :address
  belongs_to :dvendor
  has_many :cartitems



end
