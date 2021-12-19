json.week_1 do
  if activity_plan.week == "week 1"
    json.id activity_plan.id
    json.activity_name activity_plan.activity_name
    json.time activity_plan.time
    json.frequency activity_plan.frequency
  end
end

json.week_2 do
  if activity_plan.week == "week 2"
    json.id activity_plan.id
    json.activity_name activity_plan.activity_name
    json.time activity_plan.time
    json.frequency activity_plan.frequency
  end
end

json.week_3 do
  if activity_plan.week == "week 3"
    json.id activity_plan.id
    json.activity_name activity_plan.activity_name
    json.time activity_plan.time
    json.frequency activity_plan.frequency
  end
end

json.week_4 do
  if activity_plan.week == "week 4"
    json.id activity_plan.id
    json.activity_name activity_plan.activity_name
    json.time activity_plan.time
    json.frequency activity_plan.frequency
  end
end