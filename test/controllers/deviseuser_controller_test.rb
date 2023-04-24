require "test_helper"

class DeviseUserControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @deviseuser = deviseusers(:one)
    sign_in @deviseuser
  end

  test "should get new session" do
    get new_deviseuser_session_url
    assert_response :success
  end

  test "should destroy deviseuser" do
    assert_difference("Deviseuser.count", -1) do
      delete destroy_deviseuser_session_path
    end
  end
end
