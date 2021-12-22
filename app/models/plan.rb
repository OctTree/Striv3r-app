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
  after_create :create_activity_plan

  #======================================= Methods ===================================================================

  def send_email
    PlanMailer.send_plan_email(id).deliver_now
    PlanMailer.send_plan_email_to_admin(id).deliver_now
  end

  def create_activity_plan
    1.upto(days_per_week) do
      ActivityPlan.create(user_id: user_id, activity_name: activity_type, week: "week #{Date.current.week_of_month}",
                          time: minutes, frequency: frequency_days, activity_at: Date.current)
    end
  end
end
