class LogisticaController < ApplicationController
	def index
		
	end

	def create
		@contact = Contact.create(contact_params)

		LogisticMailer.contact_email(@contact).deliver
		LogisticMailer.private_email(@contact).deliver
	end

	 private
    def contact_params
      params.require(:contact).permit(:name, :email, :last_name, :phone, :product_name, :product_link, :address)
    end
end
