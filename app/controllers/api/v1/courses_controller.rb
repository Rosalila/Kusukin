class Api::V1::CoursesController < Api::V1::ApplicationController
  protect_from_forgery with: :null_session

  def save
    @course = Course.new(course_params)
    @course.save

    render json: nil, status: :ok
  end

  def get
    @course = Course.find_by(id: params[:course_id])
    render json: nil, status: :ok

    render json: nil, status: :unprocessable_entity unless @course
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end
end
