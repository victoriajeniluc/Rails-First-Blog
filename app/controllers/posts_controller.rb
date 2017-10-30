class PostsController < ApplicationController 

	before_action :authorize 
	
	def index 
		@posts = Post.all.order('created_at DESC') 
	end 

	def new 
		@post = Post.new 
	end 

	# to save our post... we have make a post 
	def create 
		@post = Post.new(post_params)
		@post.user_id = current_user.id 
		if @post.save 
			redirect_to @post
		else 
			@errors = @post.errors.full_messages 
			render 'new'
		end 	
	end 

	def show 
		@post = Post.find(params[:id])
	end 

	def edit
		@post = Post.find(params[:id])
	end 

	def update 
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else 
			@errors = @post.errors.full_messages
			render 'edit'
		end 
	end 
	
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end 

	# rails 4 has a strong parameter where you have explicity state what you want to allow.. so you have to make a private method 
	private 
		def post_params 
			params.require(:post).permit(:title, :body)
		end 
end 
