require "test_helper"

class SambasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sambas_index_url
    assert_response :success
  end
end
