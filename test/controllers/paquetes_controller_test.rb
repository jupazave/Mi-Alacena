require 'test_helper'

class PaquetesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get paquetes" do
    get :paquetes
    assert_response :success
  end

end
