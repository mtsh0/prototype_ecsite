class Order < ActiveRecord::Base
  #relation
  belongs_to :user
  belongs_to :address
  belongs_to :dvendor
  has_many :cartitems

end
