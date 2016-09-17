require 'test_helper'

class TeamLeadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_leader = team_leaders(:one)
  end

  test "should get index" do
    get team_leaders_url
    assert_response :success
  end

  test "should show team_leader" do
    get team_leader_url(@team_leader)
    assert_response :success
  end

end
