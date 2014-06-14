class PedidosProductos < ActiveRecord::Base
	belongs_to :pedidos
	belongs_to :productos
end
