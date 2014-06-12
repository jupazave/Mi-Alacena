class InicioController < ApplicationController
	def index
		
	end

	def json

		render :json => {:hola => "2"} 
  	end


  	def estados

		render :json => Estados.all
  	end
end
