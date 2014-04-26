class TblEquivalentCourseController < ApplicationController
  def new
    @TblEquivalentCourse = TblEquivalentCourse.new
  end
  attr_accessor :approval_id, :transfer_id, :eq_course_alpha, :eq_course_num, :course_title,
                :eq_hours, :conn, :uhh_atr, :pr

  def initialize(attributes = {})
    @approval_id = attributes[:approval_id]
    @transfer_id = attributes[:transfer_id]
    @eq_course_alpha  = attributes[:eq_course_alpha]
    @eq_course_num = attributes[:eq_course_num]
    @course_title = attributes[:course_title]
    @eq_hours = attributes[:eq_hours]
    @conn = attributes[:conn]
    @uhh_atr = attributes[:uhh_atr]
    @pr = attributes[:pr]
  end
end
