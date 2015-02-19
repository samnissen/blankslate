json.array!(@variables) do |variable|
  json.extract! variable, :id, :prompt, :name, :validation_type, :validation, :task_id
  json.url variable_url(variable, format: :json)
end
