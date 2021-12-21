class AddColumnFrequencyDaysToPlan < ActiveRecord::Migration[6.1]
  def change
    add_column :plans, :frequency_days, :integer, default: 0
    add_column :plans, :frequency_minutes, :integer, default: 0
  end
end
