class Ventas < ActiveRecord::Base

	belongs_to :pedido
	belongs_to :producto
end
