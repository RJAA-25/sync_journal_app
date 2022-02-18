require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest

	test "should create category" do
		get new_category_path(username: "username")
		assert_response :success
		# assert_difference "Category.count", 1 do
			post create_category_path(username: "username"), params: { category: { title: "title", description: "description" } }
			assert_response :redirect
		# end
		follow_redirect!
		assert_response :success
	end

	test "handle create category error" do
		get new_category_path(username: "username")
		assert_response :success
		post create_category_path(username: "username"), params: { category: { description: "description" } }
		assert_response :success
	end

end