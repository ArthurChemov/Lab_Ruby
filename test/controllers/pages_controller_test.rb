require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @library = libraries(:one)
  end

  test "should get user info" do
    get user_info_url
    assert_response :success
  end

  test "should get library info" do
    get library_info_url
    assert_response :success
  end

  test "should search library name" do
    get search_library_name_url(@library)
    assert_response :success
  end

  test "should search user name" do
    get search_user_name_url(@user)
    assert_response :success
  end

  test "should search user email" do
    get search_user_email_url(@user)
    assert_response :success
  end
end
