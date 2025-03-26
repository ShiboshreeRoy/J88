require "test_helper"

class Admin::DepositsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_deposits_index_url
    assert_response :success
  end

  test "should get approve" do
    get admin_deposits_approve_url
    assert_response :success
  end
end
