require 'test_helper'

class ItemUsersControllerTest < ActionController::TestCase
  setup do
    @item_user = item_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_user" do
    assert_difference('ItemUser.count') do
      post :create, item_user: { create: @item_user.create, destroy: @item_user.destroy, index: @item_user.index }
    end

    assert_redirected_to item_user_path(assigns(:item_user))
  end

  test "should show item_user" do
    get :show, id: @item_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_user
    assert_response :success
  end

  test "should update item_user" do
    put :update, id: @item_user, item_user: { create: @item_user.create, destroy: @item_user.destroy, index: @item_user.index }
    assert_redirected_to item_user_path(assigns(:item_user))
  end

  test "should destroy item_user" do
    assert_difference('ItemUser.count', -1) do
      delete :destroy, id: @item_user
    end

    assert_redirected_to item_users_path
  end
end
