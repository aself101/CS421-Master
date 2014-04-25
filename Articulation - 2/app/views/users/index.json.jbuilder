json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :middle_initial, :last_name, :email, :major, :term, :year, :phone
  json.url user_url(user, format: :json)
end
