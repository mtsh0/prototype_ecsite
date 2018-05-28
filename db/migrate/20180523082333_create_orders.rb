class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_no
      t.string :total_price
      t.references :user, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true
      t.references :dvendor, index: true, foreign_key: true
      t.string :d_number

      t.timestamps
    end
  end
end
