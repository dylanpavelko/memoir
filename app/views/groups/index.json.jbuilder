json.array!(@groups) do |group|
  json.extract! group, :id, :chunk_id, :parentGroup_id, :storylineTag_id, :characterTag_id, :age, :era_id, :contentDate, :detailLevel_id, :order
  json.url group_url(group, format: :json)
end
