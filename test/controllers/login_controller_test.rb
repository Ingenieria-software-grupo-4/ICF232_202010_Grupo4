require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get metodologin" do
    get login_metodologin_url
    assert_response :success
  end

end
