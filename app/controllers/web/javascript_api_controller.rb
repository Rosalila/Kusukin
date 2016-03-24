class Web::JavascriptApiController < ApplicationController
  protect_from_forgery with: :null_session

  def test
    render json: {"result":"You are connected to Kusukin"}
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
    ucd=UserCourseStorage.where(:user_id=>params[:user_id],:course_id=>params[:course_id])[0]
    render json: ucd.json_data
  end
end
