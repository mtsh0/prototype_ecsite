# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  itemCodeNo   :integer
#  partNumber   :string(255)
#  itemName     :string(255)
#  genre_id     :integer
#  subgenre_id  :integer
#  topDispflg   :integer
#  price        :float(24)
#  shippingUnit :integer
#  description  :string(255)
#  attention    :string(255)
#  mainImage    :string(255)
#  image2       :string(255)
#  image3       :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Item < ActiveRecord::Base
  # pagination(kaminari)
  paginates_per 15

  # relation
  has_many :orders, through: :cartitems
  belongs_to :genre
  belongs_to :subgenre

  # uploader
  mount_uploader :mainImage, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader

  # validation
  validates :itemCodeNo, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than_or_equals_to: 0} #商品コード
  validates :partNumber, presence: true #品番
  validates :itemName, presence: true, uniqueness: true #商品名
  validates :description, presence: true #商品説明
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0}
  validates :mainImage, presence: true

end
