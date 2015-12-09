class ExamsController < ApplicationController
  before_action :authenticate_user!, :only => [:edit, :update, :destroy]
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  # GET /exams
  # GET /exams.json
  def index
    @exams = Exam.all
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam = Exam.new
  end

  # GET /exams/1/edit
  def edit
    validate_user_access(@exam.course)
  end

  # POST /exams
  # POST /exams.json
  def create
    @exam = Exam.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to @exam, notice: 'Exam was successfully created.' }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    validate_user_access(@exam.course)

    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    validate_user_access(@exam.course)

    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params[:exam][:files]
      make_pdf params[:exam][:files]
      params.require(:exam).permit(:language, :date, :description, :author, :files)
    end

    # Validate that current_user has right to manage courses under the subject
    def validate_user_access(course)
      return if current_user.is_super_admin
      return redirect_to root_path unless current_user.subjects.include?(course.subject)
    end

    def make_pdf files
      if(files.length > 1)
        list = Magick::ImageList.new()

          files.each {|f|
            list.from_blob(f.read)
          }
      list.write("public/testi.pdf")

      end
    end
end
