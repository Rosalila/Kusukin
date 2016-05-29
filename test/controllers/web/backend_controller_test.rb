require 'test_helper'

class Web::BackendControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    sign_in @user
    @course = courses(:one)
  end

  test 'get courses' do
    get :courses, course_id: @course.id
    assert_response :success
  end

  test 'get balance' do
    get :balance
    assert_response :success
  end

  test 'get pending_assignments' do
    get :pending_assignments
    assert_response :success
  end

  test 'get checked_assignments' do
    get :checked_assignments
    assert_response :success
  end
end
