class ProductosController < ApplicationController

  def estados
    render :json => Estado.all
  end

  def productos
    my_json = []

    if request.xhr?

      Producto.all.where(productos_params).each do |producto|

        if producto.categoria_id != 1

          my_json << {
            :id => producto.id,
            :name => producto.name,
            :price => producto.price,
            :image => producto.image.url(:medium)
          }
          
        end
      end
    end 
    render :json => my_json 
  end

  private

    def productos_params
      params.permit(:estado_id)
    end
end
