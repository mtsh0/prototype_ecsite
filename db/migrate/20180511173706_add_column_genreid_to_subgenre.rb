class AddColumnGenreidToSubgenre < ActiveRecord::Migration
  def change
    add_column :subgenres, :genre_id, :integer, after: :name
  end
end
