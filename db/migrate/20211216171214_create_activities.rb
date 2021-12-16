class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.references :user, index: true
      t.string :activity_name
      t.datetime :performed_at
      t.string :time_spent
      t.string :remaining_time

      t.timestamps
    end
  end
end
