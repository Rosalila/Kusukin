class EnrollmentController < ApplicationController
  #before_action :set_enrollment, only: [:index, :show, :destroy]

  layout 'backend/dashboard'

  def show
  end

  def new
    course = Course.find(params[:id])

    unless course.nil?
      enrollment = Enrollment.new
      enrollment.user_id = current_user.id
      enrollment.course_id = course.id
      enrollment.progress = 0

      #verify if a user have enrollments before save it
      unless enrollment.user_has_enrollments
        enrollment.save ? redirect_to(in_progress_courses_path) : redirect_to(:back)
      end

      redirect_to in_progress_courses_path
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
end
