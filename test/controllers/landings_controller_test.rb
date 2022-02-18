require "test_helper"

class LandingsControllerTest < ActionDispatch::IntegrationTest
  # test "should get index" do
  #   get landings_index_url
  #   assert_response :success
  # end

  test "should get to root page" do
    get root_path
    assert_response :success
  end

end
