require 'test_helper'

class SpeciesBaseStatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @species_base_stat = species_base_stats(:one)
  end

  test "should get index" do
    get species_base_stats_url
    assert_response :success
  end

  test "should get new" do
    get new_species_base_stat_url
    assert_response :success
  end

  test "should create species_base_stat" do
    assert_difference('SpeciesBaseStat.count') do
      post species_base_stats_url, params: { species_base_stat: { base_attack: @species_base_stat.base_attack, base_defense: @species_base_stat.base_defense, base_stamina: @species_base_stat.base_stamina, monster_no: @species_base_stat.monster_no } }
    end

    assert_redirected_to species_base_stat_url(SpeciesBaseStat.last)
  end

  test "should show species_base_stat" do
    get species_base_stat_url(@species_base_stat)
    assert_response :success
  end

  test "should get edit" do
    get edit_species_base_stat_url(@species_base_stat)
    assert_response :success
  end

  test "should update species_base_stat" do
    patch species_base_stat_url(@species_base_stat), params: { species_base_stat: { base_attack: @species_base_stat.base_attack, base_defense: @species_base_stat.base_defense, base_stamina: @species_base_stat.base_stamina, monster_no: @species_base_stat.monster_no } }
    assert_redirected_to species_base_stat_url(@species_base_stat)
  end

  test "should destroy species_base_stat" do
    assert_difference('SpeciesBaseStat.count', -1) do
      delete species_base_stat_url(@species_base_stat)
    end

    assert_redirected_to species_base_stats_url
  end
end
