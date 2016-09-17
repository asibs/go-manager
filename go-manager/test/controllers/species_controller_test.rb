require 'test_helper'

class SpeciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @species = species(:one)
  end

  test "should get index" do
    get species_index_url
    assert_response :success
  end

  test "should show species" do
    get species_url(@species)
    assert_response :success
  end

end
