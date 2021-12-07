class Plan < ApplicationRecord

  #======================================= Relationships ==============================================================

  belongs_to :user

  #======================================= Validations ================================================================

  validates_presence_of :days_per_week, :minutes, :day_on_week, :goals
end
