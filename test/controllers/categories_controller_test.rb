require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get new_category_path(username: "username")
    assert_response :success
  end

  test "should get edit" do
    get edit_category_path(username: "username", category_id: 1)
    assert_response :success
  end

end
