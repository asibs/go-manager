require 'test_helper'

class AppraisalIndividualPhrasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appraisal_individual_phrase = appraisal_individual_phrases(:one)
  end

  test "should get index" do
    get appraisal_individual_phrases_url
    assert_response :success
  end

  test "should get new" do
    get new_appraisal_individual_phrase_url
    assert_response :success
  end

  test "should create appraisal_individual_phrase" do
    assert_difference('AppraisalIndividualPhrase.count') do
      post appraisal_individual_phrases_url, params: { appraisal_individual_phrase: { max_individual_id: @appraisal_individual_phrase.max_individual_id, min_individual_iv: @appraisal_individual_phrase.min_individual_iv, phrase: @appraisal_individual_phrase.phrase } }
    end

    assert_redirected_to appraisal_individual_phrase_url(AppraisalIndividualPhrase.last)
  end

  test "should show appraisal_individual_phrase" do
    get appraisal_individual_phrase_url(@appraisal_individual_phrase)
    assert_response :success
  end

  test "should get edit" do
    get edit_appraisal_individual_phrase_url(@appraisal_individual_phrase)
    assert_response :success
  end

  test "should update appraisal_individual_phrase" do
    patch appraisal_individual_phrase_url(@appraisal_individual_phrase), params: { appraisal_individual_phrase: { max_individual_id: @appraisal_individual_phrase.max_individual_id, min_individual_iv: @appraisal_individual_phrase.min_individual_iv, phrase: @appraisal_individual_phrase.phrase } }
    assert_redirected_to appraisal_individual_phrase_url(@appraisal_individual_phrase)
  end

  test "should destroy appraisal_individual_phrase" do
    assert_difference('AppraisalIndividualPhrase.count', -1) do
      delete appraisal_individual_phrase_url(@appraisal_individual_phrase)
    end

    assert_redirected_to appraisal_individual_phrases_url
  end
end
