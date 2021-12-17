class PlanMailer < ApplicationMailer

  def send_plan_email(plan_id)
    @plan = Plan.find(plan_id)

    mail(to: @plan.user.email, subject: 'Striv3 plan')
  end
end
