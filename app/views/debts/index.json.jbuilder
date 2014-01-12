json.array!(@debts) do |debt|
  json.extract! debt, :id, :friend_id, :amount, :type, :expirity, :status
  json.url debt_url(debt, format: :json)
end
