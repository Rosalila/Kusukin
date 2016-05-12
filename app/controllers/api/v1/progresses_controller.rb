class Api::V1::ProgressesController < Api::V1::ApplicationController
  protect_from_forgery with: :null_session

  def save
    user_id = params[:user_id]
    course_id = params[:course_id]
    progress = params[:progress]
    user = User.find_by(authentication_token: [params[:auth_token]], id: user_id)
    course = Course.find_by(id: course_id)

    unless user
      render json: { "error": 'User does not exists' }, status: :unprocessable_entity
      return
    end
    unless course
      render json: { "error": 'Course does not exists' }, status: :unprocessable_entity
      return
    end

    @ucd = UserCourseStorage.find_by(user_id: user_id, course_id: course_id)
    unless @ucd
      @ucd = UserCourseStorage.new
      @ucd.user_id = user_id
      @ucd.course_id = course_id
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
    user_id = params[:user_id]
    unless User.exists?(id: user_id)
      render json: { "error": 'User does not exists' }, status: :unprocessable_entity
      return
    end
    @ucd = UserCourseStorage.find_by(course_id: params[:course_id], user_id: user_id)

    if @ucd
      render json: @ucd, status: :unprocessable_entity unless @ucd
    else
      render json: nil, status: :unprocessable_entity unless @ucd
    end
  end
end
