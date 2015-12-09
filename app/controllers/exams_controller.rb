class ExamsController < ApplicationController
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
  end

  # POST /exams
  # POST /exams.json
  def create
    name0 = "test1"
    name1 = "test2"

    directory = "pictures"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(exam_params['exam_file'][0].read) }
    File.open(path, "wb") { |f| f.write(exam_params['exam_file'][1].read) }

    pictures = Magick::ImageList.new('test1.jpg', 'test2.jpg').each_with_index { |img, i|
      img.resize_to_fit!(800, 800)
      img.write("test.pdf") {
        self.quality = 80
        self.density = '300'
        self.colorspace = Magick::RGBColorspace
        self.interlace = Magick::NoInterlace
      }
    }
    file = Tempfile.new(name)
    picture.write(file.path)
    exam_params['exam_file'] = picture
    puts exam_params
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
      params.require(:exam).permit(:language, :date, :description, :exam_file)
    end
end
