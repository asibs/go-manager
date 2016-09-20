require 'test_helper'

class TrainerLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trainer_level = trainer_levels(:one)
  end

  test "should get index" do
    get trainer_levels_url
    assert_response :success
  end

  test "should show trainer_level" do
    get trainer_level_url(@trainer_level)
    assert_response :success
  end

end
