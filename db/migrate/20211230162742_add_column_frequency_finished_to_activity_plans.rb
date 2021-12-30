class AddColumnFrequencyFinishedToActivityPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :activity_plans, :frequency_finished, :integer, default: 0
  end
end
