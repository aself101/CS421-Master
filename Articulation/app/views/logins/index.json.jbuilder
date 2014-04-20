json.array!(@logins) do |login|
  json.extract! login, :id, :user_id, :email, :password
  json.url login_url(login, format: :json)
end
