class AddColumnCustomeridToUser < ActiveRecord::Migration
  def change
    add_column :users, :customer_id, :string, after: :email
  end
end
