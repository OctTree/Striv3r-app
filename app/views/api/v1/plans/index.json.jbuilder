json.plans do
  json.partial! partial: 'api/v1/plans/plan', as: :plan, collection: @plans
end