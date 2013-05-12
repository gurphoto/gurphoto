require 'test_helper'

class Hotel::Service::ValuesControllerTest < ActionController::TestCase
  setup do
    @hotel_service_value = hotel_service_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotel_service_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotel_service_value" do
    assert_difference('Hotel::Service::Value.count') do
      post :create, hotel_service_value: @hotel_service_value.attributes
    end

    assert_redirected_to hotel_service_value_path(assigns(:hotel_service_value))
  end

  test "should show hotel_service_value" do
    get :show, id: @hotel_service_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotel_service_value
    assert_response :success
  end

  test "should update hotel_service_value" do
    put :update, id: @hotel_service_value, hotel_service_value: @hotel_service_value.attributes
    assert_redirected_to hotel_service_value_path(assigns(:hotel_service_value))
  end

  test "should destroy hotel_service_value" do
    assert_difference('Hotel::Service::Value.count', -1) do
      delete :destroy, id: @hotel_service_value
    end

    assert_redirected_to hotel_service_values_path
  end
end
