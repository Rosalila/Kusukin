require 'test_helper'

class Api::V1::AchievementControllerTest < ActionController::TestCase
  setup do
    @user = users :one
    @course = courses :one

    sign_in @user
  end

  test "should post unlock" do
    post :unlock, format: :json, achievement: { achievement_id: 1}

    assert_response 200
  end

  test "should get index" do
    #post :save, format: :json, course: { name: "A", description: "B"}
    #get :index, format: :json, user_id: 1

    assert_response 200
  end

end
