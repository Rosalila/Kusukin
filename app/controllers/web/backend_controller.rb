class Web::BackendController < ApplicationController

  layout 'backend/dashboard'

  def courses
    if params[:course_id]
      @courses = Course.where(user_id: current_user.id).order('created_at ASC')
      @course = Course.find_by_id(params[:course_id])
    else
      @course = Course.new
    end
  end

  def balance
  end

  def pending_assignments
  end

  def checked_assignments
  end

end
