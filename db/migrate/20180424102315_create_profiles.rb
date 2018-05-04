class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :name, null: false
      t.string :name_kana, null: false
      t.string :postal_code, null: false
      t.string :prefecture_id, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :others
      t.timestamps null: false
    end
  end
end
