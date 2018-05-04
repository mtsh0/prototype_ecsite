class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :type
      t.string :titile
      t.string :description
      t.string :image

      t.timestamps null: false
    end
  end
end
