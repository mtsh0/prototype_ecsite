class RemoveColumnGenreidToGenre < ActiveRecord::Migration
  def change
    remove_column :genres, :genre_id, :integer
  end
end
