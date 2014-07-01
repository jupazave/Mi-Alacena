class CarritoController < ApplicationController
  def index

    productos = []

    session[:carrito].each do | producto |

      productos << producto["id"]

    end

    @carrito = [] 

    Producto.where(id: productos).each do | producto |

      productos << producto["id"]

      session[:carrito].each do | producto_en_carrito |

        if producto_en_carrito["id"].to_i == producto[:id]

          @carrito << {
            :producto => producto,
            :cantidad => producto_en_carrito["cantidad"]
          }

          break
        end
      end
    end
  end

  def pago
    
  end

  def pagado

    Conekta.api_key = "key_soq6Dkb7VtcbszP3"
    @error = nil

    begin
      charge = Conekta::Charge.create({
        amount: 51000,
        currency: "MXN",
        description: "Pizza Delivery",
        reference_id: "orden_de_id_interno",
        card: params[:conektaTokenId] 
        #"tok_a4Ff0dD2xYZZq82d9"
      })
    rescue Conekta::ParameterValidationError => e
      @error = e.message 
      #alguno de los parámetros fueron inválidos
    rescue Conekta::ProcessingError => e
      @error =  e.message 
      #la tarjeta no pudo ser procesada
    rescue Conekta::Error
      @error =  e.message 
      #un error ocurrió que no sucede en el flujo normal de cobros como por ejemplo un auth_key incorrecto
    end

  end

  def agregar
  	# render :json => pago_params
    agregar_params[:productos].split(/,/).each do |producto|

      session[:carrito] << {
        :id => producto,
        :cantidad => 1

      }

    end

  	redirect_to carrito_path
  end

  def actualizar

    params[:productos].each do |producto|
      id = producto[1]["id"]
      cantidad = producto[1]["cantidad"].to_i

      session[:carrito].each do | producto_en_carrito |

        if producto_en_carrito["id"] == id

          producto_en_carrito["cantidad"] = cantidad

          break
        end
      end


    end

    
    render :json => {:status => true}
  end

  def vaciar
    session[:carrito] = []
    redirect_to root_path
  end

  def borrar

    my_json = []

    productos = session[:carrito]

    producto_id = delete_params[:producto_id]

    session[:carrito].each_with_index do |en_carrito, index|

      if producto_id == en_carrito["id"]
        productos.delete_at(index)
      end

    end

    session[:carrito] = session[:carrito]

    render :json => {:status => true}
  end

  private

    def delete_params
      params.permit(:producto_id)
    
    end

  	def agregar_params
  		params.permit(:productos)
  		
  	end
end
