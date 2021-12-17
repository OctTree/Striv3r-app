ActiveAdmin.register ActivityPlan do
  permit_params :activity_name, :week, :frequency, :user_id, :time
end
