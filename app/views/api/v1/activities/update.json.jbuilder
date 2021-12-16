json.plan do
  json.partial! @activity, locale: {activity: @activity}
end