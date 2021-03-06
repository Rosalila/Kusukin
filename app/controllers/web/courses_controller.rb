class Web::CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :join_enrollment]

  layout 'backend/dashboard'
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  def in_progress
    @enrollments = current_user.enrollments
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id

    if @course.save
      redirect_to controller: 'backend', action: 'courses'
    else
      format.html { render :new }
      format.json { render json: @course.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    redirect_to controller: 'backend', action: 'courses'
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :description)
  end
end
