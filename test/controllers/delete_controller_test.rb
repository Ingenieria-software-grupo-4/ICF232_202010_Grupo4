require 'test_helper'

class DeleteControllerTest < ActionDispatch::IntegrationTest
  test "should get metododelete" do
    get delete_metododelete_url
    assert_response :success
  end

end
