class TblInstitutionController < ApplicationController
  def new
    @TblInstitution = :institution_name, :city, :state, :zip, :website
  end
  attr_accessor
  #initializing an array of attributes
  def initialize(attributes = {})
    @institution_name = attributes[:institution_name]
    @city = attributes[:city]
    @state = attributes[:state]
    @zip = attributes[:zip]
    @website = attributes[:website]
  end
end
