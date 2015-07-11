class Enrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  
  def user_has_enrollments
    enrollments = Enrollment.where(course_id: self.course.id, user_id: self.user.id) 
    enrollments.size > 0
  end
end
