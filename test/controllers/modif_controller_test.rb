require 'test_helper'

class ModifControllerTest < ActionDispatch::IntegrationTest
  test "should get metodomodif" do
    get modif_metodomodif_url
    assert_response :success
  end

end
