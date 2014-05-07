class TblEquivalentCoursesController < ApplicationController
  before_action :set_tbl_equivalent_course, only: [:show, :edit, :update, :destroy]

  # GET /tbl_equivalent_courses
  # GET /tbl_equivalent_courses.json
  def index
    @tbl_equivalent_courses = TblEquivalentCourse.all
  end

  # GET /tbl_equivalent_courses/1
  # GET /tbl_equivalent_courses/1.json
  def show
  end

  # GET /tbl_equivalent_courses/new
  def new
    @tbl_equivalent_course = TblEquivalentCourse.new
  end

  # GET /tbl_equivalent_courses/1/edit
  def edit
  end

  # POST /tbl_equivalent_courses
  # POST /tbl_equivalent_courses.json
  def create
    @tbl_equivalent_course = TblEquivalentCourse.new(tbl_equivalent_course_params)

    respond_to do |format|
      if @tbl_equivalent_course.save
        format.html { redirect_to @tbl_equivalent_course, notice: 'Tbl equivalent course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tbl_equivalent_course }
      else
        format.html { render action: 'new' }
        format.json { render json: @tbl_equivalent_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tbl_equivalent_courses/1
  # PATCH/PUT /tbl_equivalent_courses/1.json
  def update
    respond_to do |format|
      if @tbl_equivalent_course.update(tbl_equivalent_course_params)
        format.html { redirect_to @tbl_equivalent_course, notice: 'Tbl equivalent course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tbl_equivalent_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tbl_equivalent_courses/1
  # DELETE /tbl_equivalent_courses/1.json
  def destroy
    @tbl_equivalent_course.destroy
    respond_to do |format|
      format.html { redirect_to tbl_equivalent_courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tbl_equivalent_course
      @tbl_equivalent_course = TblEquivalentCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tbl_equivalent_course_params
      params.require(:tbl_equivalent_course).permit(:transferID, :approvalID, :eq_course_alpha, :eq_course_num, :course_title, :eq_hours, :conn, :uhh_atr, :pr)
    end
end
