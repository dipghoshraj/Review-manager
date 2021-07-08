require "test_helper"

class ResturantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resturant = resturants(:one)
  end

  test "should get index" do
    get resturants_url, as: :json
    assert_response :success
  end

  test "should create resturant" do
    assert_difference('Resturant.count') do
      post resturants_url, params: { resturant: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show resturant" do
    get resturant_url(@resturant), as: :json
    assert_response :success
  end

  test "should update resturant" do
    patch resturant_url(@resturant), params: { resturant: {  } }, as: :json
    assert_response 200
  end

  test "should destroy resturant" do
    assert_difference('Resturant.count', -1) do
      delete resturant_url(@resturant), as: :json
    end

    assert_response 204
  end
end
