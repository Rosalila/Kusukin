class Web::BackendController < ApplicationController
  layout 'backend/dashboard'

  def courses
    @courses = Course.where(user_id: current_user.id).order('created_at ASC')
    #return if params[:course_id]
    if params[:course_id]
      @course = Course.find_by_id(params[:course_id])
    end
  end

  def balance
  end

  def pending_assignments
  end

  def checked_assignments
  end
end
