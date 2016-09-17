require 'test_helper'

class TeamLeaderAppraisalBestStatPhrasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_leader_appraisal_best_stat_phrase = team_leader_appraisal_best_stat_phrases(:one)
  end

  test "should get index" do
    get team_leader_appraisal_best_stat_phrases_url
    assert_response :success
  end

  test "should show team_leader_appraisal_best_stat_phrase" do
    get team_leader_appraisal_best_stat_phrase_url(@team_leader_appraisal_best_stat_phrase)
    assert_response :success
  end

end
