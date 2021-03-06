class CommentsController < ApplicationController 

	def create 
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(params[:comment].permit(:name, :body))
		@comment.user_id = current_user.id 
		if @comment.save 
			redirect_to post_path(@post)
		end 
	end 

	def destroy 
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy 
		redirect_to post_path(@post)
	end 
end 