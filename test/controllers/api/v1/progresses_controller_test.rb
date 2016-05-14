require 'test_helper'

class Api::V1::ProgressesControllerTest < ActionController::TestCase
  setup do
    @user = users :one
    @course = courses :one
    @wrong_user_id = 1001
    @wrong_course_id = 1001

    sign_in @user
  end

  test 'should post save' do
    post :save, format: :json, user_email: @user.email, course_id: @course.id, progress: { 'player1_wins' => 0, 'player2_wins' => 0 }

    assert_response 200
  end

  test 'should not post save without user' do
    post :save, format: :json, user_id: @wrong_user_id, course_id: @course.id, progress: { 'player1_wins' => 0, 'player2_wins' => 0 }

    assert_response 422
  end

  test 'should not post save without course' do
    post :save, format: :json, user_id: @user.id, course_id: @wrong_course_id, progress: { 'player1_wins' => 0, 'player2_wins' => 0 }

    assert_response 422
  end

  test 'should get progress' do
    post :save, format: :json, user_email: @user.email, course_id: @course.id, progress: { 'player1_wins' => 0, 'player2_wins' => 0 }
    get :get, format: :json, course_id: @course.id, user_email: @user.email

    assert_response 200
  end

  test 'should not get progress with wrong course id' do
    post :save, format: :json, user_id: @user.id, course_id: 0, progress: { 'player1_wins' => 0, 'player2_wins' => 0 }
    get :get, format: :json, course_id: @wrong_course_id, user_id: @user.id

    assert_response 422
  end

  test 'should not get progress with wrong user' do
    post :save, format: :json, user_id: @user.id, course_id: @course.id, progress: { 'player1_wins' => 0, 'player2_wins' => 0 }
    get :get, format: :json, course_id: @course.id, user_id: @wrong_user_id

    assert_response 422
  end
end
