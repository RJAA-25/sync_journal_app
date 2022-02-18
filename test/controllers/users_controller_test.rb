require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get index_user_path(username: "username")
    assert_response :success
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should get edit" do
    get edit_user_path(username: "username")
    assert_response :success
  end
  
end
