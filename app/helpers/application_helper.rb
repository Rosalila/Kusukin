module ApplicationHelper
  def myBalance
    client = DogecoinClient.new
		if client.valid?
      return client.get_balance("themoreyoube_user_"+current_user.id.to_s , 0)
    end
    return -1
  end

  def myAddress
    client = DogecoinClient.new
		if client.valid?
      return client.get_account_address "themoreyoube_user_"+current_user.id.to_s
    end
    return "error"
  end
end
