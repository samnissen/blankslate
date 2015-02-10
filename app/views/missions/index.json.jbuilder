json.array!(@missions) do |mission|
  json.extract! mission, :id, :user_id, :class_name, :class_code, :variables, :interface_id
  json.url mission_url(mission, format: :json)
end
