require 'test_helper'

class LevelsDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @levels_datum = levels_data(:one)
  end

  test "should get index" do
    get levels_data_url
    assert_response :success
  end

  test "should get new" do
    get new_levels_datum_url
    assert_response :success
  end

  test "should create levels_datum" do
    assert_difference('LevelsDatum.count') do
      post levels_data_url, params: { levels_datum: { candy_to_power_up: @levels_datum.candy_to_power_up, cp_multiplier: @levels_datum.cp_multiplier, cp_multiplier: @levels_datum.cp_multiplier, level: @levels_datum.level, level: @levels_datum.level, stardust_to_power_up: @levels_datum.stardust_to_power_up } }
    end

    assert_redirected_to levels_datum_url(LevelsDatum.last)
  end

  test "should show levels_datum" do
    get levels_datum_url(@levels_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_levels_datum_url(@levels_datum)
    assert_response :success
  end

  test "should update levels_datum" do
    patch levels_datum_url(@levels_datum), params: { levels_datum: { candy_to_power_up: @levels_datum.candy_to_power_up, cp_multiplier: @levels_datum.cp_multiplier, cp_multiplier: @levels_datum.cp_multiplier, level: @levels_datum.level, level: @levels_datum.level, stardust_to_power_up: @levels_datum.stardust_to_power_up } }
    assert_redirected_to levels_datum_url(@levels_datum)
  end

  test "should destroy levels_datum" do
    assert_difference('LevelsDatum.count', -1) do
      delete levels_datum_url(@levels_datum)
    end

    assert_redirected_to levels_data_url
  end
end
