class TblApprovesController < ApplicationController
  def new
    @TblApproves = TblApprove.new
  end
  attr_accessor :approval_id, :user_id
  def initialize(attributes = {})
    @approval_id  = attributes[:approval_id]
    @user_id = attributes[:user_id]
  end
end
