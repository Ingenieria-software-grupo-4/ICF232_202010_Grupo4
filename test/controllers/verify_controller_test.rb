require 'test_helper'

class VerifyControllerTest < ActionDispatch::IntegrationTest
  test "should get metodoverify" do
    get verify_metodoverify_url
    assert_response :success
  end

end
