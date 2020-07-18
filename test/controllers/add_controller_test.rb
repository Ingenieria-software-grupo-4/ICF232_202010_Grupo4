require 'test_helper'

class AddControllerTest < ActionDispatch::IntegrationTest
  test "should get metodoadd" do
    get add_metodoadd_url
    assert_response :success
  end

end
