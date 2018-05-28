class CreateOrdercartitems < ActiveRecord::Migration
  def change
    create_table :ordercartitems do |t|
      t.integer :order_id
      t.integer :cartitem_id

      t.timestamps
    end
  end
end
