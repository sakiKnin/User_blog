class CommentsController < ApplicationController
	
	def new
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build
	end	

	def edit
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:name, :body))
		if @comment.save
			redirect_to @post
	    	else
			render 'new'
	    	end	
	end
	
	def update
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		if @comment.update(post_params)
		   redirect_to @post
		else
		   render 'edit'
	    	end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	private
	  	def post_params
			params.require(:comment).permit(:name, :body)
	  	end
end
