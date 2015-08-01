json.array!(@content_blocks) do |content_block|
  json.extract! content_block, :id, :contentType_id, :style_id, :content
  json.url content_block_url(content_block, format: :json)
end
