class AddColumnTimeSpentToActivityPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :activity_plans, :time_spent, :integer, default: 0
    add_column :activity_plans, :remaining_time, :integer, :default => 0
  end
end
