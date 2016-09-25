require 'test_helper'

class MonsterEvolutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monster_evolution = monster_evolutions(:one)
  end

  test "should get index" do
    get monster_evolutions_url
    assert_response :success
  end

  test "should get new" do
    get new_monster_evolution_url
    assert_response :success
  end

  test "should create monster_evolution" do
    assert_difference('MonsterEvolution.count') do
      post monster_evolutions_url, params: { monster_evolution: { monster_id: @monster_evolution.monster_id, species_id: @monster_evolution.species_id } }
    end

    assert_redirected_to monster_evolution_url(MonsterEvolution.last)
  end

  test "should show monster_evolution" do
    get monster_evolution_url(@monster_evolution)
    assert_response :success
  end

  test "should get edit" do
    get edit_monster_evolution_url(@monster_evolution)
    assert_response :success
  end

  test "should update monster_evolution" do
    patch monster_evolution_url(@monster_evolution), params: { monster_evolution: { monster_id: @monster_evolution.monster_id, species_id: @monster_evolution.species_id } }
    assert_redirected_to monster_evolution_url(@monster_evolution)
  end

  test "should destroy monster_evolution" do
    assert_difference('MonsterEvolution.count', -1) do
      delete monster_evolution_url(@monster_evolution)
    end

    assert_redirected_to monster_evolutions_url
  end
end
