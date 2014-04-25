class TblUserController < ApplicationController
  def new
    @TblUser = TblUser.new
  end
  attr_accessor :first_name, :middle_initial, :last_name, :phone, :email

  def initialize(attributes = {})
    @first_name  = attributes[:first_name]
    @middle_initial = attributes[:middle_initial]
    @last_name = attributes[:last_name]
    @phone = attributes[:phone]
    @email = attributes[:email]
  end
end
