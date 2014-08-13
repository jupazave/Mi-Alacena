class LogisticMailer < ActionMailer::Base
  default from: "hola@mialacena.mx"

  def contact_email(contact)
    @contact = contact
    attachments.inline['logo.png'] = File.read( Rails.root.join("app/assets/images/","logo.png") )
    delivery_options = { user_name: "hola@mialacena.mx",
                         password: "Mail123",
                         address: "smtp.mailgun.org" }
    mail(to: @contact.email, subject: 'Información de tu Pedido- Mi Alacena Logistics',
         delivery_method_options: delivery_options)
  end

  def private_email(contact)
    @contact = contact
    delivery_options = { user_name: "hola@mialacena.mx",
                         password: "Mail123",
                         address: "smtp.mailgun.org" }
    mail(to: "hola@mialacena.mx", subject: 'Orden de Mi Alacena Logistics',
         delivery_method_options: delivery_options)
  end
end
