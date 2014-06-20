class PaquetesProductos < ActiveRecord::Base
	belongs_to :paquete
	belongs_to :productos
end
