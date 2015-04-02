class EnrollmentController < ApplicationController
  
  def new  
    course = Course.find(params[:id])  
    if !course.nil?
      enrollment = Enrollment.new
      enrollment.user_id = current_user.id
      enrollment.course_id = course.id
      enrollment.progress = 0
    
      if enrollment.save
        #flash[:success] = "Successfully enrollment"
        redirect_to in_progress_courses_path   
      else
        render('new')
      end
    end
  end
 
end
