class CreateActivityLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_logs do |t|
      t.references :user, index: true
      t.string :name
      t.date :date_at
      t.string :minutes

      t.timestamps
    end
  end
end
