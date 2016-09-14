require 'test_helper'

class MonsterPossibleIvsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monster_possible_iv = monster_possible_ivs(:one)
  end

  test "should get index" do
    get monster_possible_ivs_url
    assert_response :success
  end

  test "should get new" do
    get new_monster_possible_iv_url
    assert_response :success
  end

  test "should create monster_possible_iv" do
    assert_difference('MonsterPossibleIv.count') do
      post monster_possible_ivs_url, params: { monster_possible_iv: { attack: @monster_possible_iv.attack, defense: @monster_possible_iv.defense, level_id: @monster_possible_iv.level_id, maxed_cp: @monster_possible_iv.maxed_cp, maxed_hp: @monster_possible_iv.maxed_hp, monster_id: @monster_possible_iv.monster_id, stamina: @monster_possible_iv.stamina } }
    end

    assert_redirected_to monster_possible_iv_url(MonsterPossibleIv.last)
  end

  test "should show monster_possible_iv" do
    get monster_possible_iv_url(@monster_possible_iv)
    assert_response :success
  end

  test "should get edit" do
    get edit_monster_possible_iv_url(@monster_possible_iv)
    assert_response :success
  end

  test "should update monster_possible_iv" do
    patch monster_possible_iv_url(@monster_possible_iv), params: { monster_possible_iv: { attack: @monster_possible_iv.attack, defense: @monster_possible_iv.defense, level_id: @monster_possible_iv.level_id, maxed_cp: @monster_possible_iv.maxed_cp, maxed_hp: @monster_possible_iv.maxed_hp, monster_id: @monster_possible_iv.monster_id, stamina: @monster_possible_iv.stamina } }
    assert_redirected_to monster_possible_iv_url(@monster_possible_iv)
  end

  test "should destroy monster_possible_iv" do
    assert_difference('MonsterPossibleIv.count', -1) do
      delete monster_possible_iv_url(@monster_possible_iv)
    end

    assert_redirected_to monster_possible_ivs_url
  end
end
