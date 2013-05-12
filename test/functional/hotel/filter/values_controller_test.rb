require 'test_helper'

class Hotel::Filter::ValuesControllerTest < ActionController::TestCase
  setup do
    @hotel_filter_value = hotel_filter_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotel_filter_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotel_filter_value" do
    assert_difference('Hotel::Filter::Value.count') do
      post :create, hotel_filter_value: @hotel_filter_value.attributes
    end

    assert_redirected_to hotel_filter_value_path(assigns(:hotel_filter_value))
  end

  test "should show hotel_filter_value" do
    get :show, id: @hotel_filter_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotel_filter_value
    assert_response :success
  end

  test "should update hotel_filter_value" do
    put :update, id: @hotel_filter_value, hotel_filter_value: @hotel_filter_value.attributes
    assert_redirected_to hotel_filter_value_path(assigns(:hotel_filter_value))
  end

  test "should destroy hotel_filter_value" do
    assert_difference('Hotel::Filter::Value.count', -1) do
      delete :destroy, id: @hotel_filter_value
    end

    assert_redirected_to hotel_filter_values_path
  end
end
