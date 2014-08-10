class LogisticaController < ApplicationController
	def index
		@contact = Contact.new
	end

	def create
		@contact = Contact.create(contact_params)
	end

	 private
    def contact_params
      params.require(:contact).permit(:name, :last_name, :phone, :product_name, :product_link, :address)
    end
end
