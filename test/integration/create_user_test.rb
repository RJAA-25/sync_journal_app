require "test_helper"

class CreateUserTest < ActionDispatch::IntegrationTest

	test "should create user" do
		get signup_path
		assert_response :success
		assert_difference "User.count", 1 do
			post signup_path, params: { user: { first_name: "John", last_name: "Doe", username: "username", password: "password" } }
			assert_response :redirect
		end
		follow_redirect!
		assert_response :success
	end

	test "handle create user error" do
		get signup_path
		assert_response :success
		post signup_path, params: { user: { first_name: "John" } }
		assert_response :success
	end

end