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

  		if request.xhr?

  			my_params = productos_params(params)

  			my_params[:estado_id] = my_params[:estado_id].to_i

			  render :json => Productos.all.where(my_params) # Limitar por estado
				
		  else
				
			 render :json => {}

  		end

  	end

  	private
  		def productos_params params
    		params.permit(:estado_id)
  		end
end
