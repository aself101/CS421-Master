class TblTransfersInController < ApplicationController
  def new
    @TblTransfersIn = TblTransfersIn.new
  end
  attr_accessor :user_id, :transfer_course_alpha, :transfer_course_num,
                :transfer_inst_name

  def initialize(attributes = {})
    @user_id = attributes[:user_id]
    @transfer_course_alpha = attributes[:transfer_course_alpha]
    @transfer_course_num = attributes[:transfer_course_num]
    @transfer_inst_name = attributes[:transfer_inst_name]
  end
end
