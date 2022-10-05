require "test_helper"

class BackgroundControllerTest < ActionDispatch::IntegrationTest
  test "should get only:" do
    get background_only:_url
    assert_response :success
  end

  test "should get :index" do
    get background_:index_url
    assert_response :success
  end
end
