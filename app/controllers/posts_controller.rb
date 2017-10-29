class PostsController < ApplicationController 
	def index 
		@posts = Post.all.order('created_at DESC') 
	end 

	def new 
	end 

	# to save our post... we have make a post 
	def create 
		@post = Post.new(post_params)
		
		if @post.save 
			redirect_to @post
		else 
			@errors = @post.errors.full_messages 
			render 'posts/new'
		end 	
	end 

	def show 
		@post = Post.find(params[:id])
	end 
	
	# rails 4 has a strong parameter where you have explicity state what you want to allow.. so you have to make a private method 
	private 
		def post_params 
			params.require(:post).permit(:title, :body)
		end 
end 
