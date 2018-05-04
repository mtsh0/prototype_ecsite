class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :itemCodeNo
      t.string :partNumber
      t.string :itemName
      t.float :price
      t.integer :shippingUnit
      t.string :description
      t.string :attention

      t.timestamps null: false
    end
  end
end
