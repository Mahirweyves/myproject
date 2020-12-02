json.extract! trade, :id, :title, :description, :address, :user_id, :created_at, :updated_at
json.url trade_url(trade, format: :json)
