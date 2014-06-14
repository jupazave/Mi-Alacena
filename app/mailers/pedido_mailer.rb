class PedidoMailer < ActionMailer::Base
	default from: 'hola@mialacena.mx'

  	def enviar_pedido(pedido)
    	@pedido = pedido
    	@pedidos_productos = PedidosProductos.all.where(:pedidos_id => pedido.id)

    	email_address_with_name = "#{pedido.name} <#{pedido.email}>"
    	mail(to: email_address_with_name,
    		subject: "Datos de compra en MiAlacena.mx",
         	bcc: ['hola@mialacena.mx', 
         		"jupazave@gmail.com", 
         		"jegs87@gmail.com", 
         		"novelo_novelo@hotmail.com"])
  	end
end
