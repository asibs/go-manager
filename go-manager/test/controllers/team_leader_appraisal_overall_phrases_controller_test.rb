require 'test_helper'

class TeamLeaderAppraisalOverallPhrasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_leader_appraisal_overall_phrase = team_leader_appraisal_overall_phrases(:one)
  end

  test "should get index" do
    get team_leader_appraisal_overall_phrases_url
    assert_response :success
  end

  test "should show team_leader_appraisal_overall_phrase" do
    get team_leader_appraisal_overall_phrase_url(@team_leader_appraisal_overall_phrase)
    assert_response :success
  end

end
