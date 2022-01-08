class CreatePointRedeems < ActiveRecord::Migration[6.1]
  def change
    create_table :point_redeems do |t|
      t.references :user, index: true
      t.integer :redeemed_point, default: 0

      t.timestamps
    end
  end
end
