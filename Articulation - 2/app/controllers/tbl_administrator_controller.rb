class TblAdministratorController < ApplicationController
  def new
    @TblAdministrator = TblAdministrator.new
  end
  attr_accessor :approval_flag

  def initialize(attributes = {})
    @approval_flag = attributes[:approval_flag]
  end
end
