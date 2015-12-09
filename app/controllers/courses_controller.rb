class CoursesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_subjects, only: [:new, :edit]

  # GET /courses
  # GET /courses.json
  def index
    @header = "Courses"
    @filterrific = initialize_filterrific(
      Course,
      params[:filterrific]
    ) or return
    @courses = @filterrific.find.page(params[:page]).order("LOWER(courses.name) asc")

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @header = @course.subject
  end

  # GET /courses/new
  def new
    @course = Course.new
    @header = "Courses"
  end

  # GET /courses/1/edit
  def edit
    validate_user_access(@course)
    @header = "Courses"
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    validate_user_access(@course)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    validate_user_access(@course)

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
    validate_user_access(@course)

    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_subjects
      @subjects = current_user.subjects
    end

    # Validate that current_user has right to manage courses under the subject
    def validate_user_access(course)
      return if current_user.is_super_admin
      return redirect_to root_path unless course.can_user_manage(current_user)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :identifier, :subject_id, :keywords)
    end
end
