require 'test_helper'

class Hotel::FiltersControllerTest < ActionController::TestCase
  setup do
    @hotel_filter = hotel_filters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotel_filters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotel_filter" do
    assert_difference('Hotel::Filter.count') do
      post :create, hotel_filter: @hotel_filter.attributes
    end

    assert_redirected_to hotel_filter_path(assigns(:hotel_filter))
  end

  test "should show hotel_filter" do
    get :show, id: @hotel_filter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotel_filter
    assert_response :success
  end

  test "should update hotel_filter" do
    put :update, id: @hotel_filter, hotel_filter: @hotel_filter.attributes
    assert_redirected_to hotel_filter_path(assigns(:hotel_filter))
  end

  test "should destroy hotel_filter" do
    assert_difference('Hotel::Filter.count', -1) do
      delete :destroy, id: @hotel_filter
    end

    assert_redirected_to hotel_filters_path
  end
end
