require "test_helper"

class CreateSessionTest < ActionDispatch::IntegrationTest

	test "should create session" do
		user = User.new(first_name: "John", last_name: "Doe", username: "username", password: "password")
		user.save
		get login_path
		assert_response :success
		post login_path, params: { session: { username: "username", password: "password" } }
		assert_response :redirect
		follow_redirect!
		assert_response :success
	end

	test "handle create session error" do
		user = User.new(first_name: "John", last_name: "Doe", username: "username", password: "password")
		user.save
		get login_path
		assert_response :success
		post login_path, params: { session: { username: "username"} }
		assert_response :success
	end

end