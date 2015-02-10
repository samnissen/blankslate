json.array!(@interfaces) do |interface|
  json.extract! interface, :id, :address, :credentials, :user_id
  json.url interface_url(interface, format: :json)
end
