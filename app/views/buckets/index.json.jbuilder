json.array!(@buckets) do |bucket|
  json.extract! bucket, :id
  json.url bucket_url(bucket, format: :json)
end
