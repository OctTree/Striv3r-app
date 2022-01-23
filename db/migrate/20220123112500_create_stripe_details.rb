class CreateStripeDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :stripe_details do |t|
      t.string :stripe_price_id
      t.float :price

      t.timestamps
    end
  end
end
