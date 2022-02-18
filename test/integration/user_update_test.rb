require "test_helper"

class UpdateUserTest < ActionDispatch::IntegrationTest
	#  comment out cross_user_restriction before testing

	test "should update user" do
		user = User.new(first_name: "John", last_name: "Doe", username: "username", password: "password")
		assert user.save
		get edit_user_path(username: "username")
		assert_response :success
		assert_difference "User.count", 0 do
			patch update_user_path(username: "username"), params: { user: { first_name: "John", last_name: "Doe", username: "username", password: "password" } }
			assert_response :redirect
		end
		follow_redirect!
		assert_response :success
	end

	test "handle create user error" do
		user = User.new(first_name: "John", last_name: "Doe", username: "username", password: "password")
		assert user.save
		get edit_user_path(username: "username")
		assert_response :success
		patch update_user_path(username: "username"), params: { user: { first_name: "John" } }
		assert_response :success
	end

end