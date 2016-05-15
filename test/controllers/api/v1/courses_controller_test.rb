require 'test_helper'

class Api::V1::CoursesControllerTest < ActionController::TestCase
  setup do
    @user = users :one
    @course = courses :one

    sign_in @user
  end

  test 'should post save' do
    post :save, format: :json, course: { name: 'A', description: 'B' }

    assert_response 200
  end

  test 'should get course' do
    post :save, format: :json, course: { name: 'A', description: 'B' }
    get :get, format: :json, course_id: @course.id

    assert_response 200
  end
end
