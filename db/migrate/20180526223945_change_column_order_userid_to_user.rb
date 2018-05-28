class ChangeColumnOrderUseridToUser < ActiveRecord::Migration
  def change
    change_column :orders, :user_id, :integer, after: :order_no
  end
end
