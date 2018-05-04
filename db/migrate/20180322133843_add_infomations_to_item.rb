class AddInfomationsToItem < ActiveRecord::Migration
  def change
    # add_column :items, :genre_id, :integer, after: :itemName
    add_column :items, :topDispflg, :integer, after: :genre_id
  end
end
