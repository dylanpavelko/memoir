json.array!(@chunks) do |chunk|
  json.extract! chunk, :id, :style_id
  json.url chunk_url(chunk, format: :json)
end
