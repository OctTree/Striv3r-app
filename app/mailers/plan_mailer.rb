class PlanMailer < ApplicationMailer

  def send_plan_email(plan_id)
    @plan = Plan.find(plan_id)

    mail(to: @plan.user.email, subject: 'Striv3 new plan')
  end

  def send_plan_email_to_admin(plan_id)
    @plan = Plan.find(plan_id)

    mail(to: "gopalakrishnanv708@gmail.com", subject: 'Striv3 new plan')
  end

  def send_customized_plan_email(user_id)
    @user = User.find(user_id)

    mail(to: @user.email, subject: 'Striv3 customized plan')
  end
end
