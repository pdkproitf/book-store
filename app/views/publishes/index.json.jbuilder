json.array!(@publishes) do |publish|
  json.extract! publish, :id, :name
  json.url publish_url(publish, format: :json)
end
