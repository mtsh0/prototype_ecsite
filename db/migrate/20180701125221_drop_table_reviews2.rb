class DropTableReviews2 < ActiveRecord::Migration
  def change
    drop_table :reviews
  end
end
