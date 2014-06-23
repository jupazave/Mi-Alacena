require 'test_helper'

class CarritoControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get pago" do
    get :pago
    assert_response :success
  end

end
