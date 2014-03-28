class PostsController < ApplicationController
	 http_basic_authenticate_with name: "root", password: "root", 
	 except: [:index, :show]
	def new
		@post = Post.new
	end
	def create
		#@post = Post.new(post_params)
		#@post.save
		#redirect_to action: :show, id: @post.id
		@post = Post.new(params[:post].permit(:title, :text))
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end
	def show	#shows the data entered on screen
		@post = Post.find(params[:id])
	end
	def index	
		@posts = Post.all
	end
	def edit
		@post = Post.find(params[:id])
	end #end edit
	def update
		@post = Post.find(params[:id])
		
		if @post.update(params[:post].permit(:title, :text))
			redirect_to @post
		else
			render 'edit'
		end
	end	#end update
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		
		redirect_to posts_path
	end
	private
		def post_params
			params.require(:post).permit(:title, :text)
		end
end
