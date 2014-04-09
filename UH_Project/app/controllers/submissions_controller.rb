class SubmissionsController < ApplicationController
  def new
  end
  def create
    @submission = Submission.new(params[:submissions])
    @submission.save
    redirect_to @submission
  end
end
