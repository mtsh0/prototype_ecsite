class AddImagecolumnsToItem < ActiveRecord::Migration
  def change
    add_column :items, :mainImage, :string, after: :attention
    add_column :items, :image2, :string, after: :mainImage
    add_column :items, :image3, :string, after: :image2
  end
end
