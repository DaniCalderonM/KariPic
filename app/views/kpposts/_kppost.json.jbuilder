json.extract! kppost, :id, :description, :kpuser_id, :created_at, :updated_at
json.url kppost_url(kppost, format: :json)
