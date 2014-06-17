class BlogController < ApplicationController
	layout "blog"

	def index
		@posts = Post.all.limit(10)
	end


	def author

		@posts = Post.all.where(:admin_user_id => params[:id])
	end

	def post

		@post = Post.find(params[:id])
		
	end
end
