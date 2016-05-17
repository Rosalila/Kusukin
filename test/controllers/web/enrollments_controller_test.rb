require 'test_helper'

class Web::EnrollmentsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @course = courses(:one)
    sign_in @user
  end

  test 'should post create' do
    post :create, course_id: @course.id

    assert_redirected_to in_progress_courses_path
  end

  test 'should destroy enrollment' do
    enrollment = enrollments(:one)
    delete :destroy, id: enrollment.id

    assert_redirected_to in_progress_courses_path
  end
end
