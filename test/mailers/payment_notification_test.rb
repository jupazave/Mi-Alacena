require 'test_helper'

class PaymentNotificationTest < ActionMailer::TestCase
  test "paypal" do
    mail = PaymentNotification.paypal
    assert_equal "Paypal", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "compropago" do
    mail = PaymentNotification.compropago
    assert_equal "Compropago", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
