class BlogController < ApplicationController
	def index
		@posts = Post.all.limit(10)
	end


	def author
		
	end

	def post

		@post = Post.find(params[:id])
		
	end
end
