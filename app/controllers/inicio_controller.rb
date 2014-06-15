class InicioController < ApplicationController
	def index
		
	end

    def estados

        render :json => Estados.all

    end

    def productos

        if request.xhr?

            my_params = productos_params(params)

			#render :json => Productos.all.where(:estados_id => my_params[:estado_id]) # Limitar por estado

            render :json => Productos.all.where(:estados_id => my_params[:estado_id])

        else

            render :json => {}

        end

    end

    def contabilizar_click

        c = Clicks.new

        c.ip = request.ip

        c.save! 

        render :json => {:save => true}

    end

    def hacer_pedido

        pedido = Pedidos.new(pedidos_params(params))

        pedido.save!



        params[:productos].each do |producto|

            pedido_producto = PedidosProductos.new

            p = Productos.find(producto[1][:id])

            pedido_producto.productos = p

            pedido_producto.pedidos = pedido

            pedido_producto.cantidad = producto[1][:cantidad]

            pedido_producto.save!

        end

        notificar pedido

        render :json => {:status => true}

    end

    def gracias

        layout "simple"

    end

    private

        def productos_params params
            params.permit(:estado_id)
        end

        def pedidos_params params
            params.permit(:name, :email, :productos)
        end

        def notificar pedido

            PedidoMailer.enviar_pedido(pedido).deliver
        end
end
