module CarritoHelper

	def total_producto producto

		producto[:cantidad] * producto[:producto].price
		
	end
end
