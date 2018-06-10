class Order < ActiveRecord::Base

  #pagination(kaminari)
  paginates_per 40

  # validation
  validates :order_no, presence: true
  validates :user_id, presence: true
  validates :address_id, presence: true
  validates :dvendor_id, presence: true, on: :update
  validates :d_number, length: {in: 10..12}, on: :update


  #relation
  belongs_to :user
  belongs_to :address
  belongs_to :dvendor
  has_many :cartitems
  has_many :items, through: :cartitems

end
