class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: proc { |c| c.request.format == 'application/json' }

  private

  # rubocop:disable all
  def after_sign_in_path_for(resource)
    session['user_return_to'] || in_progress_courses_url
  end
end
