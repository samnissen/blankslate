json.array!(@formulas) do |formula|
  json.extract! formula, :id, :name, :description, :task
  json.url formula_url(formula, format: :json)
end
