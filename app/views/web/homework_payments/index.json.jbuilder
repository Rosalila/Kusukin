json.array!(@homework_payments) do |homework_payment|
  json.extract! homework_payment, :id, :user_id, :homework_id
  json.url homework_payment_url(homework_payment, format: :json)
end
