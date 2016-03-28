class Api::V1::ProgressesController < Api::V1::ApplicationController
  protect_from_forgery with: :null_session

  def save
    user_id = current_user.id
    course_id = params[:course_id]
    progress = params[:progress]

    if User.exists?(id: user_id)==false
      render json: {"status": "Error: User does not exists"}
      return
    end
    if Course.exists?(id: course_id)==false
      render json: {"status": "Error: Course does not exists"}
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

  def status
    ucd = UserCourseStorage.find_by(user_id: params[:user_id], course_id: params[:course_id])

    if ucd
      @count_of_player1_wins ||= JSON.parse(ucd.json_data)["player1_wins"].to_i
      @count_of_player2_wins ||= JSON.parse(ucd.json_data)["player2_wins"].to_i
    else
      render json: nil, status: :unprocessable_entity unless @ucd
    end
  end

  def get
    @ucd = UserCourseStorage.find_by(course_id: params[:course_id])

    render json: nil, status: :unprocessable_entity unless @ucd
  end
end
