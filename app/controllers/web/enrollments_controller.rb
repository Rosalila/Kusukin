class Web::EnrollmentsController < ApplicationController
  layout 'backend/dashboard'

  def show
  end

  def new
    if current_user
      course = Course.find(params[:id])

      unless course.nil?
        enrollment = Enrollment.new
        enrollment.user_id = current_user.id
        enrollment.course_id = course.id
        enrollment.progress = 0

        # verify if a user have enrollments before save it
        redirect_user_from(enrollment)

        redirect_to in_progress_courses_path
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
      format.html { redirect_to :back, notice: 'Enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def redirect_user_from(enrollment)
    return if enrollment.user_has_enrollments?
    enrollment.save ? redirect_to(in_progress_courses_path) : redirect_to(:back)
  end
end
