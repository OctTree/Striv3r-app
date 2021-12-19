ActiveAdmin.register ActivityPlan do
  permit_params :activity_name, :week, :frequency, :user_id, :time, "activity_at(1i)", "activity_at(2i)", "activity_at(3i)"
end
