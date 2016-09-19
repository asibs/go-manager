require 'test_helper'

class MonsterLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monster_level = monster_levels(:one)
  end

  test "should get index" do
    get monster_levels_url
    assert_response :success
  end

  test "should show monster_level" do
    get monster_level_url(@monster_level)
    assert_response :success
  end

end
