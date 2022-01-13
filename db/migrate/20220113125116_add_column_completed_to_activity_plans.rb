class AddColumnCompletedToActivityPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :activity_plans, :completed, :boolean, default: false
  end
end
