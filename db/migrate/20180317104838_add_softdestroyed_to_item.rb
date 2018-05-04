class AddSoftdestroyedToItem < ActiveRecord::Migration
  def change
    add_column :items, :soft_destroyed_at, :datetime
    add_index :items, :soft_destroyed_at
  end
end
