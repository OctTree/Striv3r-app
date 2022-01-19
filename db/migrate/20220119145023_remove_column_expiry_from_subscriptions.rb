class RemoveColumnExpiryFromSubscriptions < ActiveRecord::Migration[6.1]
  def change
    remove_column :subscriptions, :expiry, :stripe_card_id
  end
end
