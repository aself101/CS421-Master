class PostsController < ApplicationController
  def new   #new entry

  end
  def show  #displays input
    @post = Post.find(params[:id])
  end
  def index #displays database
    @posts = Post.all
  end
  def create  #create the entry
    @post = Post.new(post_params)

    @post.save
    redirect_to @post
  end
  private # Keep private, do not want changes
    def post_params
      params.require(:post).permit(:university, :department, :course, :year, :semester)
    end
end
