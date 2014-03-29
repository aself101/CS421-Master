class PostsController < ApplicationController
  def new   #new entry
    @post = Post.new
  end
  def show  #displays input
    @post = Post.find(params[:id])
  end
  def index #displays database
    @posts = Post.all
  end
  def edit  #edit whatever post
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:university, :department, :course, :year, :semester))
      redirect_to @post
    else
      render 'edit'
    end
  end
  def destroy   #deletes entry
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
  def create  #create the entry
    @post = Post.new(params[:post].permit(:university, :department, :course, :year, :semester))

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  private # Keep private, do not want changes
    def post_params
      params.require(:post).permit(:university, :department, :course, :year, :semester)
    end
end
