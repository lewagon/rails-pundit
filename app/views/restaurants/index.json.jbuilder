json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :description, :user_id
  json.url restaurant_url(restaurant, format: :json)
end
