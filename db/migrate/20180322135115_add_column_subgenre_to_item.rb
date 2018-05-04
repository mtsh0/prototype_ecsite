class AddColumnSubgenreToItem < ActiveRecord::Migration
  def change
    add_column :items, :subgenre_id, :integer, after: :genre_id
  end
end
