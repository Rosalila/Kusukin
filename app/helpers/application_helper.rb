module ApplicationHelper
  def my_balance
    client = DogecoinClient.new
    return client.get_balance('themoreyoube_user_' + current_user.id.to_s, 0) if client.valid?

    -1
  end

  def my_address
    client = DogecoinClient.new
    return client.get_account_address 'themoreyoube_user_' + current_user.id.to_s if client.valid?

    'error'
  end
end
