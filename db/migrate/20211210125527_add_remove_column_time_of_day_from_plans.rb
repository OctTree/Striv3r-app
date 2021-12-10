class AddRemoveColumnTimeOfDayFromPlans < ActiveRecord::Migration[6.1]
  def change
    remove_column :plans, :time_of_day
    add_column :plans, :time_of_day, :text
  end
end
