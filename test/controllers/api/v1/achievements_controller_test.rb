require 'test_helper'

class Api::V1::AchievementsControllerTest < ActionController::TestCase
  setup do
    @user = users :one
    @achievement = achievements :one
    @wrong_acvievement_id = 1001

    sign_in @user
  end

  test 'should post unlock' do
    post :unlock, format: :json, achievement_id: @achievement.id, user_email: @user.email

    assert_response 200
  end

  test 'should not post unlock with wrong achievement_id' do
    post :unlock, format: :json, achievement_id: @wrong_acvievement_id, user_email: @user.email

    assert_response 422
  end

  test 'should get index' do
    get :index, format: :json, user_email: @user.email

    assert_response 200
  end
end
