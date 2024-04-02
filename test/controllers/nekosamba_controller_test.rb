require "test_helper"

class NekosambaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nekosamba_index_url
    assert_response :success
  end
end
