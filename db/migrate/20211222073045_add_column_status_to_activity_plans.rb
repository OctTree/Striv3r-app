class AddColumnStatusToActivityPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :activity_plans, :status, :integer, default: 0
  end
end
