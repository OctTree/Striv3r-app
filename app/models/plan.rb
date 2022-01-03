class Plan < ApplicationRecord

  #======================================= Relationships ==============================================================

  belongs_to :user

  #======================================= Validations ================================================================

  validates_presence_of :days_per_week, :minutes, :day_on_week, :goals

  #===================================== Enum =========================================================================

  enum time_of_day: ["morning", "noon", "evening"]

  #======================================= Callbacks ==================================================================

  after_create :send_email
  after_create :create_activity_plan

  #======================================= Methods ===================================================================

  def send_email
    PlanMailer.send_plan_email(id).deliver_now
    PlanMailer.send_plan_email_to_admin(id).deliver_now
  end

  def create_activity_plan
    1.upto(4) do |week|
      1.upto(days_per_week) do
        activity_type.each do |activity_type|
          ActivityPlan.create(user_id: user_id, activity_name: activity_type, week: "week #{week}",
                              time: minutes, frequency: frequency_days, activity_at: Date.current, frequency_days: frequency_days, frequency_minutes: frequency_minutes)
        end
      end
    end
  end
end
