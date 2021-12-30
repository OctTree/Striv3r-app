class RemoveColumnInPlans < ActiveRecord::Migration[6.1]
  def change
    remove_column :plans, :activity_type

    add_column :plans, :activity_type, :text,  array: true, default: []
  end
end
