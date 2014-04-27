class TblStaffController < ApplicationController
  def new
    @TblStaff = TblStaff.new
  end
  # Accessor function
  attr_accessor :user_id, :department, :position

  def initialize(attributes = {})
    @user_id = attributes[:user_id]
    @department = attributes[:department]
    @position = attributes[:position]
  end

end
