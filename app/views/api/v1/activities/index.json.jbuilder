json.activities do
  json.partial! partial: 'api/v1/activities/activity', as: :activity, collection: @activities
end