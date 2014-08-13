# Preview all emails at http://localhost:3000/rails/mailers/payment_notification
class PaymentNotificationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_notification/paypal
  def paypal
    PaymentNotification.paypal
  end

  # Preview this email at http://localhost:3000/rails/mailers/payment_notification/compropago
  def compropago
    PaymentNotification.compropago
  end

end
