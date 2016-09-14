require 'test_helper'

class MonsterLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monster_level = monster_levels(:one)
  end

  test "should get index" do
    get monster_levels_url
    assert_response :success
  end

  test "should get new" do
    get new_monster_level_url
    assert_response :success
  end

  test "should create monster_level" do
    assert_difference('MonsterLevel.count') do
      post monster_levels_url, params: { monster_level: { cp: @monster_level.cp, dust_to_power_up: @monster_level.dust_to_power_up, hp: @monster_level.hp, never_powered_up: @monster_level.never_powered_up } }
    end

    assert_redirected_to monster_level_url(MonsterLevel.last)
  end

  test "should show monster_level" do
    get monster_level_url(@monster_level)
    assert_response :success
  end

  test "should get edit" do
    get edit_monster_level_url(@monster_level)
    assert_response :success
  end

  test "should update monster_level" do
    patch monster_level_url(@monster_level), params: { monster_level: { cp: @monster_level.cp, dust_to_power_up: @monster_level.dust_to_power_up, hp: @monster_level.hp, never_powered_up: @monster_level.never_powered_up } }
    assert_redirected_to monster_level_url(@monster_level)
  end

  test "should destroy monster_level" do
    assert_difference('MonsterLevel.count', -1) do
      delete monster_level_url(@monster_level)
    end

    assert_redirected_to monster_levels_url
  end
end
