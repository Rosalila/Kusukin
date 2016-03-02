class Web::JavascriptApiController < ApplicationController
  protect_from_forgery with: :null_session

  def test
    #n = Nya.new
    #n.nyu=params[:a]
    #n.save
    render json: {"f":"fdsa","player1_wins":10,"player2_wins":20}
  end

  def save_progress
    ucd=UserCourseStorage.where(:user_id=>params[:user_id],:course_id=>params[:course_id])[0]
    if !ucd
      ucd=UserCourseStorage.new
      ucd.user_id=params[:user_id]
      ucd.course_id=params[:course_id]
    end
    ucd.json_data=params[:progress].to_json
    ucd.save
    render json: {"errors":[]}
  end

  def get_progress
    player1_wins=0
    player2_wins=0
    ucd=UserCourseStorage.where(:user_id=>params[:user_id],:course_id=>params[:course_id])[0]
    if ucd
      player1_wins=JSON.parse(ucd.json_data)["player1_wins"].to_i
      player2_wins=JSON.parse(ucd.json_data)["player2_wins"].to_i
    end

    render json: {"player1_wins":player1_wins,"player2_wins":player2_wins}
  end
end
