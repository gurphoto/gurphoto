require 'test_helper'

class Hotel::Filter::ItemsControllerTest < ActionController::TestCase
  setup do
    @hotel_filter_item = hotel_filter_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotel_filter_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotel_filter_item" do
    assert_difference('Hotel::Filter::Item.count') do
      post :create, hotel_filter_item: @hotel_filter_item.attributes
    end

    assert_redirected_to hotel_filter_item_path(assigns(:hotel_filter_item))
  end

  test "should show hotel_filter_item" do
    get :show, id: @hotel_filter_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotel_filter_item
    assert_response :success
  end

  test "should update hotel_filter_item" do
    put :update, id: @hotel_filter_item, hotel_filter_item: @hotel_filter_item.attributes
    assert_redirected_to hotel_filter_item_path(assigns(:hotel_filter_item))
  end

  test "should destroy hotel_filter_item" do
    assert_difference('Hotel::Filter::Item.count', -1) do
      delete :destroy, id: @hotel_filter_item
    end

    assert_redirected_to hotel_filter_items_path
  end
end
