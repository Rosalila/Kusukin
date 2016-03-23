require 'test_helper'

class Web::AchievementsControllerTest < ActionController::TestCase
  setup do
    @achievement = achievements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:achievements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create achievement" do
    assert_difference('Achievement.count') do
      post :create, achievement: { course_id: @achievement.course_id, name: @achievement.name }
    end

    assert_redirected_to controller: 'backend', action: 'courses' , course_id: @achievement.course_id, notice: 'Achievement was successfully created.'
  end

  test "should show achievement" do
    get :show, id: @achievement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @achievement
    assert_response :success
  end

  test "should update achievement" do
    patch :update, id: @achievement, achievement: { course_id: @achievement.course_id, name: @achievement.name }
    assert_redirected_to controller: 'backend', action: 'courses' , course_id: @achievement.course_id, notice: 'Achievement was successfully updated.'
  end

  test "should destroy achievement" do
    assert_difference('Achievement.count', -1) do
      delete :destroy, id: @achievement
    end

    assert_redirected_to controller: 'backend', action: 'courses' , course_id: @achievement.course_id, notice: 'Achievement was successfully destroyed.'
  end
end
