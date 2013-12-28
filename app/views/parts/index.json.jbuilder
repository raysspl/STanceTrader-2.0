json.array!(@parts) do |part|
  json.extract! part, :id, :description
  json.url part_url(part, format: :json)
end
