require 'test_helper'

class Api::V1::UsersTest < ActionController::TestCase
  test "should create account" do
    attrs = {email: "sjors@purpledunes.com", password:"12345678"}

    assert_response 200
  end
end
