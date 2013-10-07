json.array!(@crawlers) do |crawler|
  json.extract! crawler, :url, :title
  json.url crawler_url(crawler, format: :json)
end
