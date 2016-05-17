class Web::EnrollmentsController < ApplicationController
  layout 'backend/dashboard'

  def create
    # Also checking of current_user should be earlier
    if current_user && params[:course_id].present?
      course = Course.find_by(id: params[:course_id])
      if course
        enrollment = Enrollment.new
        enrollment.user_id = current_user.id
        enrollment.course_id = course.id
        enrollment.progress = 0
        redirect_user_from(enrollment)
      end
    else
      redirect_to new_user_session_path, notice: 'You are not logged in.'
    end
  end

  # DELETE /enrollment/1
  # DELETE /enrollment/1.json
  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to in_progress_courses_path, notice: 'Enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def redirect_user_from(enrollment)
    if enrollment.user_has_enrollments?
      redirect_to in_progress_courses_path, notice: 'You have already enrolled this course'
      return
    end
    enrollment.save
    redirect_to(in_progress_courses_path)
  end
end
