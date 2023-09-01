require "test_helper"

class UserMicropostsControllerTest < ActionDispatch::IntegrationTest
  test "should get microposts" do
    get user_microposts_microposts_url
    assert_response :success
  end

  test "should get index" do
    get user_microposts_index_url
    assert_response :success
  end

  test "should get new" do
    get user_microposts_new_url
    assert_response :success
  end

  test "should get show" do
    get user_microposts_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_microposts_edit_url
    assert_response :success
  end

  test "should get create" do
    get user_microposts_create_url
    assert_response :success
  end
end
