# == Schema Information
#
# Table name: infos
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Info < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
end
