json.users do
  json.partial! partial: 'api/v1/roles/role', as: :role, collection: @roles
end