require 'test_helper'

class MonsterSummariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monster_summary = monster_summaries(:one)
  end

  test "should get index" do
    get monster_summaries_url
    assert_response :success
  end

  test "should get new" do
    get new_monster_summary_url
    assert_response :success
  end

  test "should create monster_summary" do
    assert_difference('MonsterSummary.count') do
      post monster_summaries_url, params: { monster_summary: { max_attack_iv: @monster_summary.max_attack_iv, max_attack_iv: @monster_summary.max_attack_iv, max_maxed_cp: @monster_summary.max_maxed_cp, max_maxed_hp: @monster_summary.max_maxed_hp, max_stamina_iv: @monster_summary.max_stamina_iv, min_attack_iv: @monster_summary.min_attack_iv, min_defense_iv: @monster_summary.min_defense_iv, min_maxed_cp: @monster_summary.min_maxed_cp, min_maxed_hp: @monster_summary.min_maxed_hp, min_stamina_iv: @monster_summary.min_stamina_iv } }
    end

    assert_redirected_to monster_summary_url(MonsterSummary.last)
  end

  test "should show monster_summary" do
    get monster_summary_url(@monster_summary)
    assert_response :success
  end

  test "should get edit" do
    get edit_monster_summary_url(@monster_summary)
    assert_response :success
  end

  test "should update monster_summary" do
    patch monster_summary_url(@monster_summary), params: { monster_summary: { max_attack_iv: @monster_summary.max_attack_iv, max_attack_iv: @monster_summary.max_attack_iv, max_maxed_cp: @monster_summary.max_maxed_cp, max_maxed_hp: @monster_summary.max_maxed_hp, max_stamina_iv: @monster_summary.max_stamina_iv, min_attack_iv: @monster_summary.min_attack_iv, min_defense_iv: @monster_summary.min_defense_iv, min_maxed_cp: @monster_summary.min_maxed_cp, min_maxed_hp: @monster_summary.min_maxed_hp, min_stamina_iv: @monster_summary.min_stamina_iv } }
    assert_redirected_to monster_summary_url(@monster_summary)
  end

  test "should destroy monster_summary" do
    assert_difference('MonsterSummary.count', -1) do
      delete monster_summary_url(@monster_summary)
    end

    assert_redirected_to monster_summaries_url
  end
end
