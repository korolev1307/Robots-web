require 'test_helper'

class PaymenttypeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get paymenttype_index_url
    assert_response :success
  end

end
