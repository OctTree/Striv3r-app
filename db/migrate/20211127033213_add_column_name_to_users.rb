class AddColumnNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :zip, :string
    add_column :users, :referral, :string
  end
end
