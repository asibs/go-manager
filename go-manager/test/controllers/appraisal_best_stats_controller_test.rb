require 'test_helper'

class AppraisalBestStatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appraisal_best_stat = appraisal_best_stats(:one)
  end

  test "should get index" do
    get appraisal_best_stats_url
    assert_response :success
  end

  test "should show appraisal_best_stat" do
    get appraisal_best_stat_url(@appraisal_best_stat)
    assert_response :success
  end

end
