class AddColumnOrderIdToCartitem < ActiveRecord::Migration
  def change
    add_column :cartitems, :order_id, :integer, after: :item_id
  end
end
