class Api::V1::ProgressesController < Api::V1::ApplicationController
  protect_from_forgery with: :null_session

  def save
    user_id = current_user.id
    course_id = params[:course_id]
    progress = params[:progress]

    if User.exists?(id: user_id)==false
      render json: {"error": "User does not exists"}
      return
    end
    if Course.exists?(id: course_id)==false
      render json: {"error": "Course does not exists"}
      return
    end

    @ucd=UserCourseStorage.where(:user_id=>user_id,:course_id=>course_id)[0]
    if !@ucd
      @ucd=UserCourseStorage.new
      @ucd.user_id=user_id
      @ucd.course_id=course_id
    end
    @ucd.json_data=progress.to_json
    @ucd.save

    render json: nil, status: :unprocessable_entity unless @ucd
  end

  def get
    user_id = current_user.id
    if User.exists?(id: user_id)==false
      render json: {"error": "User does not exists"}
      return
    end
    @ucd = UserCourseStorage.find_by(course_id: params[:course_id],user_id: user_id)

    render json: nil, status: :unprocessable_entity unless @ucd
  end
end
