require "test_helper"

class UserTest < ActiveSupport::TestCase

	test "should not create user with empty inputs" do
		user = User.new
		assert_not user.save, "Created user with empty inputs"
	end
  
	test "should not create user with non-unique username" do
		user = User.create(first_name: "John", last_name: "Doe", username: "same_username", password: "123456")
		another_user = User.new(first_name: "John", last_name: "Doe", username: "same_username", password: "123456")
		assert_not another_user.save, "Created user with non-unique username"
	end

	test "should not create user with password input less than 6 characters" do
		user = User.new(first_name: "John", last_name: "Doe", username: "same_username", password: "12345")
		assert_not user.save, "Created user with password input less than 6 characters"
	end
	
end
