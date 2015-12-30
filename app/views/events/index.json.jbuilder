json.array!(@events) do |event|
  json.extract! event, :id, :slug, :starts_at, :description
  json.url event_url(event, format: :json)
end
