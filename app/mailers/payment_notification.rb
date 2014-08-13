class PaymentNotification < ActionMailer::Base
  default from: "hola@mialacena.mx"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_notification.paypal.subject
  #
  def paypal(pago)
    @pago = pago
    attachments.inline['logo.png'] = File.read( Rails.root.join("app/assets/images/","logo.png") )
    @surtidas = pago[:item_name1] == "DONAS SURTIDAS KRISPY KREME"
    delivery_options = { user_name: "hola@mialacena.mx",
                         password: "Mail123",
                         address: "smtp.mailgun.org" }
    mail(to: @pago[:payer_email], subject: 'Pago confirmado - Mi Alacena',
         delivery_method_options: delivery_options)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_notification.compropago.subject
  # 

  def compropago(pago)
    @pago = pago
    attachments.inline['logo.png'] = File.read( Rails.root.join("app/assets/images/","logo.png") )
    @surtidas = pago['data']['object']['payment_details']['product_name'] == "DONAS SURTIDAS KRISPY KREME"
    delivery_options = { user_name: "hola@mialacena.mx",
                         password: "Mail123",
                         address: "smtp.mailgun.org" }
    mail(to: @pago['data']['object']['payment_details']['customer_email'], subject: 'Pago confirmado - Mi Alacena',
         delivery_method_options: delivery_options)
  end
end
