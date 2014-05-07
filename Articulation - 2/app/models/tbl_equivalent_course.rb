class TblEquivalentCourse < ActiveRecord::Base
 # attr_accessible :transferID, :approvalID , :eq_course_alpha, :eq_course_num,
  #                :course_title, :uhh_atr, :pr

  belongs_to :TblTransferCourse
end
