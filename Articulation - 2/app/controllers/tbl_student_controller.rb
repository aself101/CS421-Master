class TblStudentController < ApplicationController
  def new
    @TblStudent = TblStudent.new
  end
  attr_accessor :user_id, :major, :term

  def initialize(attributes = {})
    @user_id = attributes[:user_id]
    @major = attributes[:major]
    @term = attributes[:term]
  end

end
