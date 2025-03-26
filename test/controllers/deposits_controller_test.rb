require "test_helper"

class DepositsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get deposits_new_url
    assert_response :success
  end

  test "should get create" do
    get deposits_create_url
    assert_response :success
  end

  test "should get index" do
    get deposits_index_url
    assert_response :success
  end
end
