require 'test_helper'

class TeamLeadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_leader = team_leaders(:one)
  end

  test "should get index" do
    get team_leaders_url
    assert_response :success
  end

  test "should get new" do
    get new_team_leader_url
    assert_response :success
  end

  test "should create team_leader" do
    assert_difference('TeamLeader.count') do
      post team_leaders_url, params: { team_leader: { name: @team_leader.name, team_id: @team_leader.team_id } }
    end

    assert_redirected_to team_leader_url(TeamLeader.last)
  end

  test "should show team_leader" do
    get team_leader_url(@team_leader)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_leader_url(@team_leader)
    assert_response :success
  end

  test "should update team_leader" do
    patch team_leader_url(@team_leader), params: { team_leader: { name: @team_leader.name, team_id: @team_leader.team_id } }
    assert_redirected_to team_leader_url(@team_leader)
  end

  test "should destroy team_leader" do
    assert_difference('TeamLeader.count', -1) do
      delete team_leader_url(@team_leader)
    end

    assert_redirected_to team_leaders_url
  end
end
