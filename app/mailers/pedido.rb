class Pedido < ActionMailer::Base

   	default from: 'hola@mialacena.mx'

  	def welcome(email)
    	@account = recipient
    	mail(to: recipient.email_address_with_name,
         	bcc: ['hola@mialacena.mx', 
         		"jupazave@gmail.com", 
         		"jegs87@gmail.com", 
         		"novelo_novelo@hotmail.com"])
  	end
end
