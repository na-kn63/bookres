require "test_helper"

class NewControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get new_view_url
    assert_response :success
  end
end
