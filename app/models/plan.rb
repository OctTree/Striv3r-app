class Plan < ApplicationRecord

  #======================================= Relationships ==============================================================

  belongs_to :user

  #======================================= Validations ================================================================

  validates_presence_of :days_per_week, :minutes, :day_on_week, :goals

  #===================================== Enum =========================================================================

  enum time_of_day: ["morning", "noon", "evening"]
  enum activity_type: ["run", "walk", "workout", "journal", "musical"]

  #======================================= Callbacks ==================================================================

  after_create :send_email

  #======================================= Methods ===================================================================

  def send_email
    PlanMailer.send_plan_email(id).deliver_now
  end
end
