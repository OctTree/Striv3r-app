class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, index: true
      t.integer :subscription_type
      t.float :amount
      t.string :last_four_digits
      t.string :expiry
      t.string :stripe_card_id
      t.string :token

      t.timestamps
    end
  end
end
