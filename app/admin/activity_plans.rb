ActiveAdmin.register ActivityPlan do
  menu false
  permit_params :activity_name, :week, :frequency, :user_id, :time, "activity_at(1i)", "activity_at(2i)", "activity_at(3i)"

  controller do

    def update
      activity_plan = ActivityPlan.find(params[:id])
      super do |success, failure|
        success.html { redirect_to admin_user_path(activity_plan.user) }
      end
    end

    def destroy
      activity_plan = ActivityPlan.find(params[:id])
      super do |success, failure|
        success.html { redirect_to admin_user_path(activity_plan.user) }
      end
    end
  end

  member_action :approve, method: :put do
    activity_plan = ActivityPlan.find(params[:id])
    if activity_plan.update(status: params["activity_plan"]["status"])
      redirect_to admin_user_path(activity_plan.user), notice: "Approved Successfully."
    else
      redirect_to admin_user_path(activity_plan.user), notice: "Something went wrong!"
    end
  end
end
