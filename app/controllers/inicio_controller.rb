class InicioController < ApplicationController
	def index
		
	end

	def json

		render :json => {:hola => "2"} 
  	end


  	def estados

		render :json => Estados.all

  	end

  	def productos

  		my_params = productos_params(params)

  		my_params[:estado_id] = my_params[:estado_id].to_i

		render :json => Productos.all.find_by(my_params)

  	end

  	private
  		def productos_params params
    		params.permit(:estado_id)
  		end
end
