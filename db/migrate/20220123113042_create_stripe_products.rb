class CreateStripeProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :stripe_products do |t|
      t.string :stripe_product_id

      t.timestamps
    end
  end
end
