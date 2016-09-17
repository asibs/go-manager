require 'test_helper'

class AppraisalOverallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appraisal_overall = appraisal_overalls(:one)
  end

  test "should get index" do
    get appraisal_overalls_url
    assert_response :success
  end

  test "should show appraisal_overall" do
    get appraisal_overall_url(@appraisal_overall)
    assert_response :success
  end
end
