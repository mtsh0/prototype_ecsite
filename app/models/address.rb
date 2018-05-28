class Address < ActiveRecord::Base
  #validation
  #ユーザーログイン時?
  validates :user_name, presence: true
  validates :name_kana, presence: true
  validates :tel, presence: true
  validates :postalcode, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :street, presence: true
  # validates :others

  #relation
  belongs_to :user
  belongs_to :prefecture
end
