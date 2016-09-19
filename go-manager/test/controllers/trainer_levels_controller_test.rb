require 'test_helper'

class TrainerLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trainer_level = trainer_levels(:one)
  end

  test "should get index" do
    get trainer_levels_url
    assert_response :success
  end

  test "should get new" do
    get new_trainer_level_url
    assert_response :success
  end

  test "should create trainer_level" do
    assert_difference('TrainerLevel.count') do
      post trainer_levels_url, params: { trainer_level: { level: @trainer_level.level, totalXp: @trainer_level.totalXp, xpToNextLevel: @trainer_level.xpToNextLevel } }
    end

    assert_redirected_to trainer_level_url(TrainerLevel.last)
  end

  test "should show trainer_level" do
    get trainer_level_url(@trainer_level)
    assert_response :success
  end

  test "should get edit" do
    get edit_trainer_level_url(@trainer_level)
    assert_response :success
  end

  test "should update trainer_level" do
    patch trainer_level_url(@trainer_level), params: { trainer_level: { level: @trainer_level.level, totalXp: @trainer_level.totalXp, xpToNextLevel: @trainer_level.xpToNextLevel } }
    assert_redirected_to trainer_level_url(@trainer_level)
  end

  test "should destroy trainer_level" do
    assert_difference('TrainerLevel.count', -1) do
      delete trainer_level_url(@trainer_level)
    end

    assert_redirected_to trainer_levels_url
  end
end
