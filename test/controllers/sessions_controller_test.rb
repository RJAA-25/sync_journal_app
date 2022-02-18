require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  
  test "should get new" do
    get login_path
    assert_response :success
  end

  test "handle new session error" do
    user = User.new(first_name: "John", last_name: "Doe", username: "username", password: "password")
		user.save
    session[:user_id] = user.id

    

  end

end
