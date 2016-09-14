require 'test_helper'

class MonsterAppraisalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monster_appraisal = monster_appraisals(:one)
  end

  test "should get index" do
    get monster_appraisals_url
    assert_response :success
  end

  test "should get new" do
    get new_monster_appraisal_url
    assert_response :success
  end

  test "should create monster_appraisal" do
    assert_difference('MonsterAppraisal.count') do
      post monster_appraisals_url, params: { monster_appraisal: { attack_best: @monster_appraisal.attack_best, defense_best: @monster_appraisal.defense_best, max_best_iv: @monster_appraisal.max_best_iv, max_total_iv: @monster_appraisal.max_total_iv, min_best_iv: @monster_appraisal.min_best_iv, min_total_iv: @monster_appraisal.min_total_iv, monster_id: @monster_appraisal.monster_id, stamina_best: @monster_appraisal.stamina_best } }
    end

    assert_redirected_to monster_appraisal_url(MonsterAppraisal.last)
  end

  test "should show monster_appraisal" do
    get monster_appraisal_url(@monster_appraisal)
    assert_response :success
  end

  test "should get edit" do
    get edit_monster_appraisal_url(@monster_appraisal)
    assert_response :success
  end

  test "should update monster_appraisal" do
    patch monster_appraisal_url(@monster_appraisal), params: { monster_appraisal: { attack_best: @monster_appraisal.attack_best, defense_best: @monster_appraisal.defense_best, max_best_iv: @monster_appraisal.max_best_iv, max_total_iv: @monster_appraisal.max_total_iv, min_best_iv: @monster_appraisal.min_best_iv, min_total_iv: @monster_appraisal.min_total_iv, monster_id: @monster_appraisal.monster_id, stamina_best: @monster_appraisal.stamina_best } }
    assert_redirected_to monster_appraisal_url(@monster_appraisal)
  end

  test "should destroy monster_appraisal" do
    assert_difference('MonsterAppraisal.count', -1) do
      delete monster_appraisal_url(@monster_appraisal)
    end

    assert_redirected_to monster_appraisals_url
  end
end
