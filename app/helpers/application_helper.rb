module ApplicationHelper
  def myBalance
    client = DogecoinClient.new
    return client.get_balance("themoreyoube_user_"+current_user.id.to_s , 0) if client.valid?

    return -1
  end

  def myAddress
    client = DogecoinClient.new
    return client.get_account_address "themoreyoube_user_"+current_user.id.to_s if client.valid?

    return "error"
  end
end
