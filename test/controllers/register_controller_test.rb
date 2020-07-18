require 'test_helper'

class RegisterControllerTest < ActionDispatch::IntegrationTest
  test "should get metodoregister" do
    get register_metodoregister_url
    assert_response :success
  end

end
