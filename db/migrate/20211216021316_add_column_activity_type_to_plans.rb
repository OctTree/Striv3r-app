class AddColumnActivityTypeToPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :plans, :activity_type, :integer, default: 0
  end
end
