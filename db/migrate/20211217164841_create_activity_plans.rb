class CreateActivityPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_plans do |t|
      t.references :user, index: true
      t.string :activity_name
      t.integer :week
      t.integer :time
      t.integer :frequency
      t.date :activity_at

      t.timestamps
    end
  end
end
