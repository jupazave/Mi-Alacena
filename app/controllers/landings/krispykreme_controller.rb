class Landings::KrispykremeController < Landings::ApplicationController
  def index

  	envio = Date.new(2014,9,13)

  	until Date.today < envio || Date.today === envio

  		envio = envio+14

  		if Date.today === envio

	  		envio = envio+14

	  	end
  		
  	end

  	if Date.today > envio - 4 || Date.today === envio - 4

  		@price_g =  210
  		@price_s =  260

  	else

	  	@price_g =  180
	  	@price_s =  230

  	end

  	@envio = envio

  end

  def create

    

  	name = params[:pedido][:name]
  	email = params[:pedido][:email]
  	glaseadas = params[:pedido][:glaseadas].to_i
  	surtidas = params[:pedido][:surtidas].to_i
  	sabores = nil

  	if surtidas > 0
  		sabores = params[:pedido][:sabores]
  	end

  	envio = Date.new(2014,9,13)

  	until Date.today < envio || Date.today === envio

  		envio = envio+14

  		if Date.today === envio

	  		envio = envio+14

	  	end
  		
  	end

  	if Date.today > envio - 4 || Date.today === envio - 4

  		total_g = glaseadas * 210
  		total_s = surtidas * 260

  	else

	  	total_g = glaseadas * 180
	  	total_s = surtidas * 230

  	end
  	

  	total = total_g + total_s

    if glaseadas > 0 && surtidas > 0

      packages = "Donas Krispy Kreme Surtidas (#{surtidas}) y Glaseadas (#{glaseadas})"


    elsif glaseadas > 0 && surtidas == 0

      packages = "(#{glaseadas}) Donas Krispy Kreme Glaseadas"


    elsif glaseadas == 0 && surtidas > 0

      packages = "(#{surtidas}) Donas Krispy Kreme Surtidas"
        
      
    end

  	compropago = Compropago::Client.new("sk_live_45a2107597d723ceb")
		compra = compropago.create_charge(total, packages, params[:pedido][:name], params[:pedido][:email], params[:pedido][:establishment])

    @response = JSON.parse compra.body
    
    object = {
      :id => @response["payment_id"],
      :name => params[:pedido][:name],
      :email => params[:pedido][:email],
      :tel => params[:pedido][:tel],
      :glaseadas => params[:pedido][:glaseadas],
      :surtidas => params[:pedido][:surtidas],
      :sabores => params[:pedido][:sabores],
      :fecha_envio => envio,
      :costo => total
    }

    Landings::Krispykreme.create(object)
		
  end
end
