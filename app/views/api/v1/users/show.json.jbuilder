json.user do
  json.partial! @user, locale: {user: @user}
end
json.plans do
  json.partial! partial: 'api/v1/plans/plan', as: :plan, collection: @user.plans
end

json.plan_details do
  current_user.get_plan_details
end