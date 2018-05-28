class ChangeOrderToCartitem < ActiveRecord::Migration
  def change
    change_column :cartitems, :user_id, :integer, after: :order_id
  end
end
