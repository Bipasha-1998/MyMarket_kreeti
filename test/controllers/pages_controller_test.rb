require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_url
    assert_response :success
  end
  
  test "should get home" do
    get home_url
    assert_response :success
  end

  test "should get about" do
    get about_url
    assert_response :success
  end
end
