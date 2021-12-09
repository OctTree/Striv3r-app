class RemoveColumnPlans < ActiveRecord::Migration[6.1]
  def change
    remove_column :plans, :day_on_week
    remove_column :plans, :time_of_day

    add_column :plans, :day_on_week, :text
    add_column :plans, :time_of_day, :integer
  end
end
