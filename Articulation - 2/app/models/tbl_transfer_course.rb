class TblTransferCourse < ActiveRecord::Base
 # attr_accessible :transferID, :transfer_course_alpha, :transfer_course_num,
  #                :course_title, :transfer_inst_name, :transfer_hours, :effective_term,
   #               :grp

  # creates the 1:n relationship between equivalent courses
  has_many :TblEquivalentCourses
end
