class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  layout 'backend/dashboard'
  # GET /courses
  # GET /courses.json
  def index
    enrollments = Enrollment.find_by_user_id(current_user.id)
    
    courses_ids = []
    enrollments.each do |enrollment|
      courses << enrollment.course.id
    end   
    courses_ids.uniq!
    
    @courses = Course.find_by_id(courses_ids)   
    
  end
  
  def join
    @enrollment = Enrollment.new
    @enrollment.course = Course.find(params[:course_id])
    @enrollment.user = current_user
    if @enrollment.save
      #redirect_to :action => 'courses' controller: => 'backend'
    else
      #render 'join'
    end
  end
  
  def progress
    @courses = Course.find_by_user_id(current_user.id)
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    
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

    #respond_to do |format|
      if @course.save
        #format.html { redirect_to @course, notice: 'Course was successfully createdd.' }
        #format.json { render "/backend/courses", status: :created, location: @course }
        redirect_to :controller => 'backend', :action => 'courses'
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    #end
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
    #respond_to do |format|
    #  format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      redirect_to "/backend/courses"
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description, :category_id)
    end
end
