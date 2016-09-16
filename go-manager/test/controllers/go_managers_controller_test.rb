require 'test_helper'

class GoManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @go_manager = go_managers(:one)
  end

  test "should get index" do
    get go_managers_url
    assert_response :success
  end

  test "should get new" do
    get new_go_manager_url
    assert_response :success
  end

  test "should create go_manager" do
    assert_difference('GoManager.count') do
      post go_managers_url, params: { go_manager: {  } }
    end

    assert_redirected_to go_manager_url(GoManager.last)
  end

  test "should show go_manager" do
    get go_manager_url(@go_manager)
    assert_response :success
  end

  test "should get edit" do
    get edit_go_manager_url(@go_manager)
    assert_response :success
  end

  test "should update go_manager" do
    patch go_manager_url(@go_manager), params: { go_manager: {  } }
    assert_redirected_to go_manager_url(@go_manager)
  end

  test "should destroy go_manager" do
    assert_difference('GoManager.count', -1) do
      delete go_manager_url(@go_manager)
    end

    assert_redirected_to go_managers_url
  end
end
