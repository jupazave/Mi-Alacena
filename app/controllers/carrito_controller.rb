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
  	# render :json => pago_params
    pago_params[:productos].split(/,/).each do |producto|

      session[:carrito] << {
        :id => producto,
        :cantidad => 1

      }

    end

  	redirect_to carrito_path
  end

  def actualizar
    
    redirect_to carrito_path
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

    render :json => {status => true}
  end

  private

    def delete_params
      params.permit(:producto_id)
    
    end

  	def pago_params
  		params.permit(:productos)
  		
  	end
end
