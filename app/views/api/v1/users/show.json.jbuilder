json.user do
  json.partial! @user, locale: {user: @user}
end
json.plans do
  json.partial! partial: 'api/v1/plans/plan', as: :plan, collection: @user.plans
end