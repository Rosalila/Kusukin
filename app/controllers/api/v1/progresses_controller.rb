class Api::V1::ProgressesController < Api::V1::ApplicationController
  protect_from_forgery with: :null_session

  def save
    course_id = params[:course_id]
    progress = params[:progress]

    user = User.find_by(authentication_token: [params[:user_token]], email: [params[:user_email]])
    course = Course.find_by(id: course_id)

    unless user
      render json: { "error": 'User does not exists' }, status: :unprocessable_entity
      return
    end
    unless course
      render json: { "error": 'Course does not exists' }, status: :unprocessable_entity
      return
    end

    @ucd = UserCourseStorage.find_by(user_id: user.id, course_id: course_id)
    unless @ucd
      @ucd = UserCourseStorage.new
      @ucd.user_id = user.id
      @ucd.course_id = course.id
    end
    @ucd.json_data = progress.to_json
    @ucd.save

    if @ucd
      render json: @ucd, status: :ok
    else
      render json: nil, status: :unprocessable_entity
    end
  end

  def get
    user = User.find_by(authentication_token: [params[:user_token]], email: [params[:user_email]])
    unless user
      render json: { "error": 'User does not exists' }, status: :unprocessable_entity
      return
    end
    @ucd = UserCourseStorage.find_by(course_id: params[:course_id], user_id: user.id)

    if @ucd
      render json: @ucd, status: :ok
    else
      render json: { "progress": '' }, status: :ok
    end
  end
end
