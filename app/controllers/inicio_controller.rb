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

			  render :json => Productos.all.where(my_params) # Limitar por estado
				
		  else
				
			 render :json => {}

  		end

  	end

    def contabilizar_click

      c = Clicks.new

      c.ip = request.ip

      c.save!

      render :json => {:save => 1==1}

    end

    def hacer_pedido

      pedido = Pedidos.new(pedidos_params(params))

      pedido.pagado = false
      pedido.surtido = false
      pedido.save!

      hola = nil

      params[:productos].each do |producto|

        pedido_producto = PedidosProductos.new

        p = Productos.find(producto[1][:id])

        pedido_producto.productos = p

        pedido_producto.pedidos = pedido

        pedido_producto.cantidad = producto[1][:cantidad]

        pedido_producto.save!

        hola = pedido_producto

         
      end

      notificar pedido

      render :json => {status => 1==1}




    end

  	private
  		def productos_params params
        params.permit(:estados_id)
      end

      def pedidos_params params
        params.permit(:name, :email, :productos)
      end

      def notificar pedido

        PedidoMailer.enviar_pedido(pedido).deliver



      end
end
