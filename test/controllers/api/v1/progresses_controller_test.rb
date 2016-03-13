require 'test_helper'

class Api::V1::ProgressesControllerTest < ActionController::TestCase
  setup do
    @user = users :one
    @course = courses :one

    sign_in @user
  end

  test "should post save" do
    post :save, format: :json, user_id: @user.id, course_id: @course.id, progress: { "player1_wins" => 0, "player2_wins" => 0 }

    assert_response 200
  end

  test "should post for status" do
    post :save, format: :json, user_id: @user.id, course_id: @course.id, progress: { "player1_wins" => 0, "player2_wins" => 0 }
    post :status, format: :json, user_id: @user.id, course_id: @course.id

    assert_response 200
  end

  test "should get progress" do
    post :save, format: :json, user_id: @user.id, course_id: @course.id, progress: { "player1_wins" => 0, "player2_wins" => 0 }
    get :get, format: :json, course_id: @course.id

    assert_response 200
  end

  test "should not get progress with wrong course id" do
    post :save, format: :json, user_id: @user.id, course_id: 0, progress: { "player1_wins" => 0, "player2_wins" => 0 }
    get :get, format: :json, course_id: @course.id

    assert_response 422
  end

  test "should not get status with wrong course id" do
    post :save, format: :json, user_id: @user.id, course_id: 0, progress: { "player1_wins" => 0, "player2_wins" => 0 }
    get :status, format: :json, course_id: @course.id

    assert_response 422
  end
end
