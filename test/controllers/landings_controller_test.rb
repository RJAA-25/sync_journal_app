require "test_helper"

class LandingsControllerTest < ActionDispatch::IntegrationTest

  test "should get to root page" do
    get root_path
    assert_response :success
  end

end
