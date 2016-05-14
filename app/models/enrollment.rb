class Enrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  def user_has_enrollments?
    enrollments = Enrollment.where(course_id: course.id, user_id: user.id)
    enrollments.exists?
  end
end
