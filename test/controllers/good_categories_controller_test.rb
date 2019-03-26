require 'test_helper'

class GoodCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get good_categories_new_url
    assert_response :success
  end

end
