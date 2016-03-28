class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  private
  # If your model is called User
  def after_sign_in_path_for(resource)
    session["user_return_to"] || in_progress_courses_url
  end
end
