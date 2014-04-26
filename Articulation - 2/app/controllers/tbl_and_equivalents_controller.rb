class TblAndEquivalentsController < ApplicationController
  def new
    @TblAndEquivalent = TblAndEquivalent.new
  end
  attr_accessor :articulation_id, :eq_course_alpha, :eq_course_num,
                :course_title, :eq_hours, :uhh_atr

  def initialize(attributes = {})
    @articulation_id = attributes[:articulation_id]
    @eq_course_alpha  = attributes[:eq_course_alpha]
    @eq_course_num = attributes[:eq_course_num]
    @course_title = attributes[:course_title]
    @eq_hours = attributes[:eq_hours]
    @uhh_atr = attributes[:uhh_atr]
  end

end
