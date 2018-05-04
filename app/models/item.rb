# == Schema Information
#
# Table name: items
#
#  id                :integer          not null, primary key
#  itemCodeNo        :integer
#  partNumber        :string(255)
#  itemName          :string(255)
#  price             :float(24)
#  shippingUnit      :integer
#  description       :string(255)
#  attention         :string(255)
#  mainImage         :string(255)
#  image2            :string(255)
#  image3            :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  soft_destroyed_at :datetime
#
# Indexes
#
#  index_items_on_soft_destroyed_at  (soft_destroyed_at)
#

class Item < ActiveRecord::Base

  # relation
  belongs_to :genre

  # pagination
  paginates_per 3

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
  validates :shippingUnit, presence: true, numericality: { only_integer: true, greater_than_or_equals_to: 0} #出荷単位
  validates :mainImage, presence: true

end
