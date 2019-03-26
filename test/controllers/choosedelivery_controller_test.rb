require 'test_helper'

class ChoosedeliveryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get choosedelivery_index_url
    assert_response :success
  end

end
