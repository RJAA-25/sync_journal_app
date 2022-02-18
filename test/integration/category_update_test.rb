require "test_helper"

class UpdateCategoryTest < ActionDispatch::IntegrationTest

	test "should update category" do
		category = Category.new(title: "title", description: "description")
		assert category.save
		get edit_category_path(username: "username", category_id: 1)
		assert_response :success
		assert_difference "Category.count", 0 do
			patch update_category_path(username: "username", category_id: 1), params: { category: { title: "title", description: "description" } }
			assert_response :redirect
		end
		follow_redirect!
		assert_response :success
	end


	test "handle update category error" do
		category = Category.new(title: "title", description: "description")
		assert category.save
		get edit_category_path(username: "username", category_id: 1)
		assert_response :success
		patch update_category_path(username: "username", category_id: 1), params: { category: { description: "description" } }
		assert_response :success
	end

end