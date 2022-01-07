class AddColumnReferralCodeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :referral_code, :string
    add_column :users, :point_balance, :integer
    add_column :users, :total_point_earned, :integer
  end
end
