require 'test_helper'

class DeliverycityControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get deliverycity_new_url
    assert_response :success
  end

end
