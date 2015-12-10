class SubjectsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :validate_super_admin, :only => [:new, :create, :edit, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    @header = "Subjects"
    @filterrific = initialize_filterrific(
      Subject,
      params[:filterrific]
    ) or return
    @subjects = @filterrific.find.page(params[:page]).order("LOWER(subjects.name) asc")

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @header = @subject.name
    @filterrific = initialize_filterrific(
      Course,
      params[:filterrific]
    ) or return
    @courses = @filterrific.find.page(params[:page])
    @courses = @courses.where(subject_id: @subject.id).order("LOWER(courses.name) asc")

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /subjects/new
  def new
    @header = "Add Subject"
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
    @header = "Edit" + @subject.name
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name)
    end
end
