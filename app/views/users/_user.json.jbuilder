json.extract! user, :id, :handle, :email, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
