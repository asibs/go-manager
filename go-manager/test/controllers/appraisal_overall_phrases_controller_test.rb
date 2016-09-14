require 'test_helper'

class AppraisalOverallPhrasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appraisal_overall_phrase = appraisal_overall_phrases(:one)
  end

  test "should get index" do
    get appraisal_overall_phrases_url
    assert_response :success
  end

  test "should get new" do
    get new_appraisal_overall_phrase_url
    assert_response :success
  end

  test "should create appraisal_overall_phrase" do
    assert_difference('AppraisalOverallPhrase.count') do
      post appraisal_overall_phrases_url, params: { appraisal_overall_phrase: { max_total_id: @appraisal_overall_phrase.max_total_id, min_total_iv: @appraisal_overall_phrase.min_total_iv, phrase: @appraisal_overall_phrase.phrase } }
    end

    assert_redirected_to appraisal_overall_phrase_url(AppraisalOverallPhrase.last)
  end

  test "should show appraisal_overall_phrase" do
    get appraisal_overall_phrase_url(@appraisal_overall_phrase)
    assert_response :success
  end

  test "should get edit" do
    get edit_appraisal_overall_phrase_url(@appraisal_overall_phrase)
    assert_response :success
  end

  test "should update appraisal_overall_phrase" do
    patch appraisal_overall_phrase_url(@appraisal_overall_phrase), params: { appraisal_overall_phrase: { max_total_id: @appraisal_overall_phrase.max_total_id, min_total_iv: @appraisal_overall_phrase.min_total_iv, phrase: @appraisal_overall_phrase.phrase } }
    assert_redirected_to appraisal_overall_phrase_url(@appraisal_overall_phrase)
  end

  test "should destroy appraisal_overall_phrase" do
    assert_difference('AppraisalOverallPhrase.count', -1) do
      delete appraisal_overall_phrase_url(@appraisal_overall_phrase)
    end

    assert_redirected_to appraisal_overall_phrases_url
  end
end
