class Api::V1::ProgressesController < Api::V1::ApplicationController
  protect_from_forgery with: :null_session

  def save
    ucd = UserCourseStorage.find_by(user_id: params[:user_id], course_id: params[:course_id])

    if ucd
      ucd.json_data = params[:progress].to_json
      ucd.save

      render json: {"errors":[]}, handlers: [:jbuilder]
    else
      ucd = UserCourseStorage.new
      ucd.user_id = params[:user_id]
      ucd.course_id = params[:course_id]
      ucd.json_data = { "player1_wins" => 0, "player2_wins" => 0 }.to_json

      ucd.save
    end
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
