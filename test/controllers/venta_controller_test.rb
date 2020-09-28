require 'test_helper'

class VentaControllerTest < ActionDispatch::IntegrationTest
  test "should get vender" do
    get venta_vender_url
    assert_response :success
  end

end
