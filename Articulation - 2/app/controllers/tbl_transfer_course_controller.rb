class TblTransferCourseController < ApplicationController
  def new
    @TblTransferCourse = TblTransferCourse.new
  end
  attr_accessor :transfer_id, :transfer_course_alpha, :transfer_course_num, :course_title,
                :transfer_inst_name, :transfer_hours, :effective_term, :grp

  def initialize(attributes = {})
    @transfer_id = attributes[:transfer_id]
    @transfer_course_alpha = attributes[:transfer_course_alpha]
    @transfer_course_num = attributes[:transfer_course_num]
    @course_title = attributes[:course_title]
    @transfer_inst_name = attributes[:transfer_inst_name]
    @transfer_hours = attributes[:transfer_hours]
    @effective_term = attributes[:effective_term]
    @grp = attributes[:grp]
  end
end
