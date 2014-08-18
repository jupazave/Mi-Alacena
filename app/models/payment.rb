class Payment < ActiveRecord::Base

	def payment?
		if self.service
			return "compropago"
		end
		return "paypal"
	end
end
