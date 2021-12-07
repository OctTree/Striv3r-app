class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.references :user, index: true
      t.integer :days_per_week
      t.integer :minutes
      t.string :day_on_week
      t.string :time_of_day
      t.text :goals

      t.timestamps
    end
  end
end
