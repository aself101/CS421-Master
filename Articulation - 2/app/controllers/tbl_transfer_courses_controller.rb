class TblTransferCoursesController < ApplicationController
  before_action :set_tbl_transfer_course, only: [:show, :edit, :update, :destroy]

  # GET /tbl_transfer_courses
  # GET /tbl_transfer_courses.json
  def index
    @tbl_transfer_courses = TblTransferCourse.all
  end

  # GET /tbl_transfer_courses/1
  # GET /tbl_transfer_courses/1.json
  def show
  end

  # GET /tbl_transfer_courses/new
  def new
    @tbl_transfer_course = TblTransferCourse.new
  end

  # GET /tbl_transfer_courses/1/edit
  def edit
  end

  # POST /tbl_transfer_courses
  # POST /tbl_transfer_courses.json
  def create
    @tbl_transfer_course = TblTransferCourse.new(tbl_transfer_course_params)

    respond_to do |format|
      if @tbl_transfer_course.save
        format.html { redirect_to @tbl_transfer_course, notice: 'Tbl transfer course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tbl_transfer_course }
      else
        format.html { render action: 'new' }
        format.json { render json: @tbl_transfer_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_transfer_courses/1
  # PATCH/PUT /tbl_transfer_courses/1.json
  def update
    respond_to do |format|
      if @tbl_transfer_course.update(tbl_transfer_course_params)
        format.html { redirect_to @tbl_transfer_course, notice: 'Tbl transfer course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tbl_transfer_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_transfer_courses/1
  # DELETE /tbl_transfer_courses/1.json
  def destroy
    @tbl_transfer_course.destroy
    respond_to do |format|
      format.html { redirect_to tbl_transfer_courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_transfer_course
      @tbl_transfer_course = TblTransferCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_transfer_course_params
      params.require(:tbl_transfer_course).permit(:transferID, :transfer_course_alpha, :transfer_course_num, :course_title, :transfer_inst_name, :transfer_hours, :effective_term, :grp)
    end
end
