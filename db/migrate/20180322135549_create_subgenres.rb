class CreateSubgenres < ActiveRecord::Migration
  def change
    create_table :subgenres do |t|
      t.integer :genre_id
      t.string :name
      t.timestamps
    end
  end
end
