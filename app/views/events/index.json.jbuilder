json.array!(@events) do |event|
  json.extract! event, :id, :slug, :description
  json.url event_url(event, format: :json)
end
